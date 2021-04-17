import 'package:flutter/material.dart';
import 'package:sahiplen/core/components/widgets/item/profile_list_item.dart';
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
          /*     appBar: AppBar(
            title: Text('Profil'),
            centerTitle: true,
          ), */
          body: SafeArea(
            child: Container(
              width: double.maxFinite,
              child: Column(
                children: [
                  headerField(viewModel, context),
                  items(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Column headerField(ProfileViewModel viewModel, BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        CircleAvatar(
          radius: 50.h,
          child: Text(viewModel.appUser!.nameAndSurnameFirstCharacter),
        ),
        SizedBox(height: 5.h),
        Text(
          viewModel.appUser!.displayName!.toUpperCase(),
          style: context.textTheme.headline6,
        ),
        SizedBox(height: 5.h),
        Text(
          viewModel.appUser!.city ?? 'Konum Bilinmiyor',
          style: context.textTheme.overline,
        ),
        SizedBox(height: 20.h),
      ],
    );
  }

  SingleChildScrollView items() {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileListItem(
            titleText: 'Profili Güncelle',
            subtitleText: 'Bilgilerini güncelle',
            icon: Icons.person,
            onTap: () {},
          ),
          ProfileListItem(
            titleText: 'İlan Oluştur',
            subtitleText: 'Ilan oluşturarak evcil hayvanını sahiplecek kişileri bul',
            icon: Icons.create,
            onTap: () {},
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
