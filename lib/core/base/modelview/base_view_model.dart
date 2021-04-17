import 'package:sahiplen/common/model/app_user.dart';
import 'package:sahiplen/common/repository/app_repository.dart';

import '../../../get_it.dart';
import '../../router/router_service.dart';

import 'package:fluttertoast/fluttertoast.dart';
import '../../constants/asset_constants.dart';
import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  late BuildContext context;
  bool _isLoading = false;

  final AppRepository appRepository = getIt<AppRepository>();
  final AssetContants assetContants = AssetContants.instance;
  final NavigationService navigationService = NavigationService.instance;

  set isLoadingSet(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  set setUser(AppUser? appUser) => appRepository.appUser = appUser;

  bool get isLoading => _isLoading;
  AppUser? get appUser => appRepository.appUser;

  void init();

  void setState() {
    notifyListeners();
  }

  void setContext(BuildContext context) {
    this.context = context;
  }

  void showToast(String message) async {
    await Fluttertoast.showToast(msg: message);
  }

  void showSnackBar(String message) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Theme.of(context).primaryColor,
      behavior: SnackBarBehavior.floating,
    ));
  }
}
