import 'package:flutter/material.dart';
import 'package:sahiplen/core/base/view/base_view.dart';
import 'package:sahiplen/core/components/widgets/future_builder/special_future_builder.dart';
import 'package:sahiplen/core/extensions/app_extensions.dart';
import 'package:sahiplen/ui/home/navigation_bar/profile/create_advertisement/adversitement_model.dart';

import 'user_advertisement_view_model.dart';

class UserAdvertisementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<UserAdvertisementViewModel>(
      viewModel: UserAdvertisementViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, UserAdvertisementViewModel viewModel) {
        return Scaffold(
          appBar: appBar(context),
          body: SpecialFutureBuilder<List<AdversitementModel>?>(
            future: viewModel.future,
            onSuccess: (adversitementList) {
              return ListView.builder(
                  itemCount: adversitementList!.length,
                  itemBuilder: (context, index) {
                    return Text(adversitementList[0].cityName!);
                  });
            },
          ),
        );
      },
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: Text('İlanların', style: context.textTheme.headline6),
      centerTitle: true,
    );
  }
}
