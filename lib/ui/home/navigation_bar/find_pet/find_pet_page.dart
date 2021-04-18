import 'package:flutter/material.dart';
import 'package:sahiplen/core/extensions/app_extensions.dart';
import 'package:sahiplen/core/base/view/base_view.dart';

import 'find_pet_view_model.dart';

class FindPetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<FindPetViewModel>(
      viewModel: FindPetViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, FindPetViewModel viewModel) {
        return Scaffold(
          appBar: appBar(context),
          body: Container(),
        );
      },
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: Text('Sahiplen', style: context.textTheme.headline6!.copyWith(color: context.theme.primaryColorDark)),
      centerTitle: true,
    );
  }
}
