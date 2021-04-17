import 'package:flutter/material.dart';
import 'package:sahiplen/core/base/modelview/base_view_model.dart';
import 'package:sahiplen/core/constants/error_constans.dart';
import 'package:sahiplen/core/constants/router_constants.dart';

class LoginViewModel extends BaseViewModel {
  String? email, password;
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

  Future<void> loginWithMail() async {
    try {
      isLoadingSet = true;
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        var result = await appRepository.loginWithMail(email!.trim(), password!.trim());
        if (result) {
          await navigationService.pushNamed(RouteConstant.HOME_PAGE_ROUTE);
        } else {
          showSnackBar('Bir hata oluştu');
        }
      } else {
        saveAttempted = true;
      }
    } catch (e) {
      showSnackBar(AuthErrorConstants.instance.getAuthErrorText(e.toString()));
    } finally {
      isLoadingSet = false;
    }
  }

  void obscureUpdate() {
    obscure = !obscure;
    setState();
  }
}
