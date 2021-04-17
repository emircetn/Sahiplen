import 'package:flutter/material.dart';
import 'package:sahiplen/core/base/view/base_view.dart';
import 'package:sahiplen/core/components/widgets/loading/page_loading_widget.dart';
import 'package:sahiplen/ui/auth/login/login_page.dart';
import 'package:sahiplen/ui/home/home_page.dart';

import 'landing_view_model.dart';

class LandingPage extends StatelessWidget {
  final int? homeIndex;
  const LandingPage({Key? key, this.homeIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LandingViewModel>(
        viewModel: LandingViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, LandingViewModel viewModel) {
          if (viewModel.isLoading == true) {
            return Scaffold(body: PageLoadingWidget());
          } else {
            if (viewModel.appUser == null) {
              return LoginPage();
            } else {
              return HomePage();
            }
          }
        });
  }
}
