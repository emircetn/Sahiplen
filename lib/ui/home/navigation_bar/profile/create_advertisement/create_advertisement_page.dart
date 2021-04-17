import 'package:flutter/material.dart';
import 'package:sahiplen/core/base/view/base_view.dart';

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
          body: Container(),
        );
      },
    );
  }
}
