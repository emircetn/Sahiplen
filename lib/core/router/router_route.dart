import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sahiplen/core/constants/router_constants.dart';
import 'package:sahiplen/ui/auth/landing/landing_page.dart';
import 'package:sahiplen/ui/auth/login/login_page.dart';
import 'package:sahiplen/ui/auth/register/register_page.dart';
import 'package:sahiplen/ui/home/home_page.dart';

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
        return CupertinoPageRoute(builder: (_) => HomePage());
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
