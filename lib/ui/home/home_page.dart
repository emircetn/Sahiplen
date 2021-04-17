import 'package:flutter/material.dart';
import 'package:sahiplen/core/extensions/app_extensions.dart';
import 'package:sahiplen/core/base/view/base_view.dart';
import 'package:sahiplen/ui/auth/login/login_page.dart';
import 'package:sahiplen/ui/auth/register/register_page.dart';

import 'home_view_model.dart';
import 'navigation_bar/find_pet/find_pet_page.dart';
import 'navigation_bar/main/main_page.dart';
import 'navigation_bar/profile/profile_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, HomeViewModel viewModel) {
        return Scaffold(
          body: body(viewModel),
          bottomNavigationBar: bottomNavigationBar(viewModel),
        );
      },
    );
  }

  PageView body(HomeViewModel viewModel) {
    return PageView(
      controller: viewModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        MainPage(),
        FindPetPage(),
        ProfilePage(),
      ],
    );
  }

  BottomNavigationBar bottomNavigationBar(HomeViewModel viewModel) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Ana Sayfa'),
        BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Keşfet'),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profil'),
      ],
      currentIndex: viewModel.page,
      onTap: (index) => viewModel.updateNavbarIndex(index),
    );
  }
}
