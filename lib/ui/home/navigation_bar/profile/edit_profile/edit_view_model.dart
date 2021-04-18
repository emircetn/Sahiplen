import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sahiplen/common/model/app_user.dart';
import 'package:sahiplen/core/base/modelview/base_view_model.dart';

class EditProfileViewModel extends BaseViewModel {
  late AppUser tempUser;
  File? profileImage;
  DateTime? currentBackPressTime;

  @override
  void init() {
    tempUser = appUser!.clone();
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  Future<bool> onWillPop() async {
    if (appUser!.isEqual(tempUser) && profileImage == null) {
      return true;
    } else {
      var now = DateTime.now();
      if (currentBackPressTime == null || now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
        currentBackPressTime = now;
        showToast('Değişiklikleri kaydetmedin! Kaydetmeden çıkmak istiyorsan lütfen tekrar bas');
        return false;
      }

      return true;
    }
  }
}
