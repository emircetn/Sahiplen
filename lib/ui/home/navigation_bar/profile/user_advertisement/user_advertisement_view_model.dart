import 'package:flutter/material.dart';
import 'package:sahiplen/core/base/modelview/base_view_model.dart';
import 'package:sahiplen/ui/home/navigation_bar/profile/create_advertisement/adversitement_model.dart';

class UserAdvertisementViewModel extends BaseViewModel {
  Future<List<AdversitementModel>?>? future;

  @override
  void init() {
    future = getUserAdversitement();
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  Future<List<AdversitementModel>?>? getUserAdversitement() async {
    return await appRepository.getUserAdversitement();
  }
}
