import 'package:flutter/material.dart';
import 'package:sahiplen/core/base/view/base_view.dart';
import 'package:sahiplen/core/components/button/special_button.dart';
import 'package:sahiplen/core/components/textformfield/special_text_form_field.dart';
import 'package:sahiplen/core/components/widgets/avatar/image_update_avatar.dart';
import 'package:sahiplen/core/extensions/app_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'edit_view_model.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<EditProfileViewModel>(
      viewModel: EditProfileViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, EditProfileViewModel viewModel) {
        return WillPopScope(
          onWillPop: () => viewModel.onWillPop(),
          child: Scaffold(
            appBar: appBar(context),
            body: body(viewModel),
          ),
        );
      },
    );
  }

  SingleChildScrollView body(EditProfileViewModel viewModel) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20.h),
          pickImageField(viewModel),
          SizedBox(height: 10.h),
          formField(viewModel),
          saveButton(viewModel),
        ],
      ),
    );
  }

  ImageUpdateAvatar pickImageField(EditProfileViewModel viewModel) {
    return ImageUpdateAvatar(
      networkImage: viewModel.appUser!.profileUrl,
      fileImage: viewModel.profileImage,
      updateButtonOnTap: () async => await viewModel.selectProfilePicture(),
    );
  }

  Form formField(EditProfileViewModel viewModel) {
    return Form(
      key: viewModel.formKey,
      child: Column(
        children: [
          SpecialTextFormField(
            labelText: 'Adın Soyadın',
            initialValue: viewModel.appUser!.displayName,
            textInputAction: TextInputAction.done,
            saveAttempted: true,
            keyboardType: TextInputType.text,
            onChanged: (_displayName) => viewModel.tempUser.displayName = _displayName,
            validator: (_displayName) => viewModel.appRepository.displayNameCheck(_displayName),
          ),
        ],
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: Text('Profilini Düzenle', style: context.textTheme.headline6),
      centerTitle: true,
    );
  }

  SpecialButton saveButton(EditProfileViewModel viewModel) {
    return SpecialButton(
      isLoading: viewModel.isLoading,
      text: 'Değişiklikleri Kaydet',
      onPressed: () async => await viewModel.updateUserInformation(),
    );
  }
}
