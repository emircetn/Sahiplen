import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sahiplen/core/constants/router_constants.dart';
import 'package:sahiplen/ui/auth/landing/landing_page.dart';
import 'package:sahiplen/ui/auth/login/login_page.dart';
import 'package:sahiplen/ui/auth/register/register_page.dart';
import 'package:sahiplen/ui/home/home_page.dart';
import 'package:sahiplen/ui/home/navigation_bar/profile/create_advertisement/create_advertisement_page.dart';
import 'package:sahiplen/ui/home/navigation_bar/profile/create_advertisement/location_selector/location_selector_page.dart';
import 'package:sahiplen/ui/home/navigation_bar/profile/edit_profile/edit_profile.dart';
import 'package:sahiplen/ui/home/navigation_bar/profile/user_advertisement/user_advertisement.dart';
import 'package:sahiplen/ui/home/other/show_image_page.dart';

class NavigationRoute {
  static NavigationRoute? _instace;
  static NavigationRoute get instance {
    _instace ??= NavigationRoute._init();
    return _instace!;
  }

  NavigationRoute._init();

  Route<CupertinoPageRoute> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments; //argumanlar
    switch (settings.name) {
      case RouteConstant.LANDING_PAGE_ROUTE:
        return CupertinoPageRoute(builder: (_) => LandingPage());
      case RouteConstant.LOGIN_PAGE_ROUTE:
        return CupertinoPageRoute(builder: (_) => LoginPage());
      case RouteConstant.REGISTER_PAGE_ROUTE:
        return CupertinoPageRoute(builder: (_) => RegisterPage());
      case RouteConstant.HOME_PAGE_ROUTE:
        return CupertinoPageRoute(builder: (_) => HomePage(page: arguments as int?));
      case RouteConstant.EDIT_PROFILE_PAGE_ROUTE:
        return CupertinoPageRoute(builder: (_) => EditProfilePage());
      case RouteConstant.CREATE_ADVERTISEMENT_PAGE_ROUTE:
        return CupertinoPageRoute(builder: (_) => CreateAdvertisementPage());
      case RouteConstant.LOCATION_SELECTOR_PAGE_ROUTE:
        return CupertinoPageRoute(builder: (_) => LocationSelectorPage(onCallBack: arguments as Function(String, String, String?)?));
      case RouteConstant.SHOW_IMAGE_PAGE_ROUTE:
        return CupertinoPageRoute(
            fullscreenDialog: true,
            builder: (_) => settings.arguments is String
                ? ShowImagePage(networkImageUrl: settings.arguments as String)
                : ShowImagePage(fileImage: settings.arguments as File));
      case RouteConstant.USER_ADVERTOSEMENT_PAGE_ROUTE:
        return CupertinoPageRoute(builder: (_) => UserAdvertisementPage());
      default:
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: Text('Hata'),
              centerTitle: true,
            ),
            body: Center(
              child: Text('Ters giden bir şeyler oldu'),
            ),
          ),
        );
    }
  }
}
