import 'package:flutter/material.dart';
import 'package:sahiplen/core/components/widgets/avatar/profile_avatar.dart';
import 'package:sahiplen/core/components/widgets/item/profile_list_item.dart';
import 'package:sahiplen/core/constants/router_constants.dart';
import 'package:sahiplen/core/extensions/app_extensions.dart';
import 'package:sahiplen/core/base/view/base_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'profile_view_model.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      viewModel: ProfileViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, ProfileViewModel viewModel) {
        return Scaffold(
          appBar: appBar(context, viewModel),
          body: body(viewModel, context),
        );
      },
    );
  }

  AppBar appBar(BuildContext context, ProfileViewModel viewModel) {
    return AppBar(
      title: Text('Sahiplen', style: context.textTheme.headline6!.copyWith(color: context.theme.primaryColorDark)),
      centerTitle: true,
      actions: [
        IconButton(icon: Icon(Icons.exit_to_app), onPressed: () async => await viewModel.signOut()),
      ],
    );
  }

  SafeArea body(ProfileViewModel viewModel, BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.maxFinite,
        child: Column(
          children: [
            headerField(viewModel, context),
            items(viewModel),
          ],
        ),
      ),
    );
  }

  Column headerField(ProfileViewModel viewModel, BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        ProfileAvatar(appUser: viewModel.appUser!),
        SizedBox(height: 5.h),
        Text(
          viewModel.appUser!.displayName!.toUpperCase(),
          style: context.textTheme.headline6,
        ),
        SizedBox(height: 20.h),
      ],
    );
  }

  SingleChildScrollView items(ProfileViewModel viewModel) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileListItem(
            titleText: 'Profili Güncelle',
            subtitleText: 'Bilgilerini güncelle',
            icon: Icons.person,
            onTap: () => viewModel.navigationService.pushNamed(RouteConstant.EDIT_PROFILE_PAGE_ROUTE),
          ),
          ProfileListItem(
            titleText: 'İlan Oluştur',
            subtitleText: 'Ilan oluşturarak evcil hayvanını sahiplecek kişileri bul',
            icon: Icons.create,
            onTap: () => viewModel.navigationService.pushNamed(RouteConstant.CREATE_ADVERTISEMENT_PAGE_ROUTE),
          ),
          ProfileListItem(
            titleText: 'İlanların',
            subtitleText: 'Ilanlarını görüntüle',
            icon: Icons.featured_play_list,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
