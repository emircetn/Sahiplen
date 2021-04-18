import 'package:flutter/material.dart';
import 'package:sahiplen/core/base/view/base_view.dart';
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

  Column body(BuildContext context, CreateAdvertisementViewModel viewModel) {
    return Column(
      children: [
        Text(''),
      ],
    );
  }
}
