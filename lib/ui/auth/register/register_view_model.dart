import 'package:flutter/material.dart';
import 'package:sahiplen/common/model/app_user.dart';
import 'package:sahiplen/core/base/modelview/base_view_model.dart';
import 'package:sahiplen/core/constants/error_constans.dart';
import 'package:sahiplen/core/constants/router_constants.dart';

class RegisterViewModel extends BaseViewModel {
  String? email, password, displayName;
  late bool obscure;
  late GlobalKey<FormState> formKey;
  late bool saveAttempted;
  @override
  void init() {
    formKey = GlobalKey<FormState>();
    saveAttempted = false;
    obscure = false;
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  void obscureUpdate() {
    obscure = !obscure;
    setState();
  }

  Future<void> registerWithMail() async {
    try {
      isLoadingSet = true;

      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        try {
          var tempAppUser = AppUser(displayName: displayName!.trim(), email: email!.trim());
          var result = await appRepository.registerWithMail(tempAppUser, password!);
          if (result) {
            await navigationService.pushNamedAndRemoveUntil(RouteConstant.HOME_PAGE_ROUTE);
          } else {
            showSnackBar('Bir hata oluştu');
          }
        } catch (e) {
          showSnackBar(AuthErrorConstants.instance.getAuthErrorText(e.toString()));
        }
      } else {
        saveAttempted = true;
      }
    } finally {
      isLoadingSet = false;
    }
  }
}
