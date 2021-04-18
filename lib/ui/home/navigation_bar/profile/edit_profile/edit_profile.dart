import 'package:flutter/material.dart';
import 'package:sahiplen/core/extensions/app_extensions.dart';
import 'package:sahiplen/core/base/view/base_view.dart';

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
            body: Container(),
          ),
        );
      },
    );
  }
}
