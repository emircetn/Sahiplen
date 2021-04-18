import 'package:flutter/material.dart';
import 'package:sahiplen/core/base/view/base_view.dart';
import 'package:sahiplen/core/components/textformfield/special_text_form_field.dart';
import 'package:sahiplen/core/extensions/app_extensions.dart';

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
      child: Form(
        key: viewModel.formKey,
        child: Column(
          children: [
            SpecialTextFormField(
              labelText: 'İlan başlığı',
              textInputAction: TextInputAction.newline,
              maxLength: 50,
              maxLines: 2,
              validator: (header) {},
              onSaved: (header) {},
            ),
            SpecialTextFormField(
              labelText: 'İlan açıklaması',
              textInputAction: TextInputAction.newline,
              maxLength: 150,
              maxLines: 5,
              validator: (header) {},
              onSaved: (header) {},
            ),
          ],
        ),
      ),
    );
  }
}
