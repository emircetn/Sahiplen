import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sahiplen/common/model/app_user.dart';
import 'package:sahiplen/core/base/modelview/base_view_model.dart';
import 'package:sahiplen/core/components/widgets/picker/image_picker_modal_sheet.dart';
import 'package:sahiplen/core/constants/router_constants.dart';

class EditProfileViewModel extends BaseViewModel {
  late AppUser tempUser;
  late GlobalKey<FormState> formKey;

  File? profileImage;
  DateTime? currentBackPressTime;

  @override
  void init() {
    tempUser = appUser!.clone();
    formKey = GlobalKey<FormState>();
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

  Future<void> selectProfilePicture() async {
    profileImage = await ImagePickerModelSheet.instance.addPhoto(profileImage, context, 1);
    setState();
  }

  Future<void> updateUserInformation() async {
    try {
      isLoadingSet = true;
      if (tempUser.isEqual(appUser) && profileImage == null) {
        showToast('Herhangi bir değişiklik yapmadın');
      } else {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          var result = await appRepository.updateUserInformation(tempUser, profileImage);
          if (result) {
            await navigationService.pushNamedAndRemoveUntil(RouteConstant.HOME_PAGE_ROUTE, arguments: 2);
          } else {
            showToast('Bir hata oluştu');
          }
        }
      }
    } finally {
      isLoadingSet = false;
    }
  }
}
