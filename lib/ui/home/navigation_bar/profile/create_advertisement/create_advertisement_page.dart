import 'package:flutter/material.dart';
import 'package:sahiplen/core/base/view/base_view.dart';
import 'package:sahiplen/core/components/button/special_button.dart';
import 'package:sahiplen/core/components/textformfield/special_text_form_field.dart';
import 'package:sahiplen/core/components/widgets/avatar/image_update_avatar.dart';
import 'package:sahiplen/core/extensions/app_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'create_advertisement_view_model.dart';

class CreateAdvertisementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<CreateAdvertisementViewModel>(
      viewModel: CreateAdvertisementViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, CreateAdvertisementViewModel viewModel) {
        return Scaffold(
          appBar: appBar(context),
          body: body(context, viewModel),
        );
      },
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: Text('İlan oluşturun', style: context.textTheme.headline6),
      centerTitle: true,
    );
  }

  SingleChildScrollView body(BuildContext context, CreateAdvertisementViewModel viewModel) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20.h),
          pickImageField(viewModel),
          SizedBox(height: 10.h),
          selectLocationField(viewModel),
          selectPetField(viewModel),
          SizedBox(height: 10.h),
          formField(viewModel),
          publishButton(viewModel),
        ],
      ),
    );
  }

  ListTile selectLocationField(CreateAdvertisementViewModel viewModel) {
    return ListTile(
      onTap: () async => await viewModel.pushLocationSelectorPage(),
      leading: CircleAvatar(child: Icon(Icons.location_on)),
      title: Text(
        viewModel.adversitementModel.cityName ?? 'Konum Girin',
      ),
      subtitle: viewModel.adversitementModel.cityName == null ? null : Text(viewModel.adversitementModel.getDistictAndQuarter),
    );
  }

  ListTile selectPetField(CreateAdvertisementViewModel viewModel) {
    return ListTile(
      leading: CircleAvatar(child: Icon(Icons.pets)),
      subtitle: DropdownButton<String>(
        hint: Text('Evcil hayvanınız ne?'),
        underline: Container(),
        value: viewModel.selectedPet,
        items: viewModel.appConstants.petList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) => viewModel.dropDownOnChanged(value),
      ),
    );
  }

  Form formField(CreateAdvertisementViewModel viewModel) {
    return Form(
      key: viewModel.formKey,
      child: Column(
        children: [
          SpecialTextFormField(
            labelText: 'İlan başlığı',
            textInputAction: TextInputAction.newline,
            maxLength: 50,
            maxLines: 2,
            validator: (header) => viewModel.headerValidator(header),
            onSaved: (header) => viewModel.adversitementModel.adversitementHeader = header,
          ),
          SpecialTextFormField(
            labelText: 'İlan açıklaması',
            textInputAction: TextInputAction.newline,
            maxLength: 150,
            maxLines: 5,
            validator: (explanation) => viewModel.explanationValidator(explanation),
            onSaved: (explanation) => viewModel.adversitementModel.advertisementExplanation = explanation,
          ),
        ],
      ),
    );
  }

  ImageUpdateAvatar pickImageField(CreateAdvertisementViewModel viewModel) {
    return ImageUpdateAvatar(
      fileImage: viewModel.advertisementImage,
      updateButtonOnTap: () async => await viewModel.addPetPicture(),
    );
  }

  SpecialButton publishButton(CreateAdvertisementViewModel viewModel) {
    return SpecialButton(
      isLoading: viewModel.isLoading,
      text: 'İlanı Yayınla',
      onPressed: () async => await viewModel.publishAdversitement(),
    );
  }
}
