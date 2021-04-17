import 'package:sahiplen/get_it.dart';

import 'core/router/router_service.dart';
import 'core/theme/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/router/router_route.dart';
import 'ui/auth/landing/landing_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getItSetup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sahiplen',
          onGenerateRoute: NavigationRoute.instance.generateRoute,
          theme: ThemeConstants.instance.lightTheme,
          home: LandingPage(),
          navigatorKey: NavigationService.instance.navigatorKey,
        );
      },
    );
  }
}
