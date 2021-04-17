import 'package:flutter/material.dart';
import 'package:sahiplen/common/model/app_user.dart';
import 'package:sahiplen/core/base/modelview/base_view_model.dart';
import 'package:sahiplen/core/constants/error_constans.dart';

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

  Future<bool> registerWithMail() async {
    try {
      isLoadingSet = true;

      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        try {
          var tempAppUser = AppUser(displayName: displayName!.trim(), email: email!.trim());
          return await appRepository.registerWithMail(tempAppUser, password!);
        } catch (e) {
          showSnackBar(AuthErrorConstants.instance.getAuthErrorText(e.toString()));
          return false;
        }
      } else {
        saveAttempted = true;
        return false;
      }
    } finally {
      isLoadingSet = false;
    }
  }
}
