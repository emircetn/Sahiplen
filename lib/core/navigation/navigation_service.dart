import 'package:flutter/cupertino.dart';

class NavigationService {
  static NavigationService? _instace;
  static NavigationService get instance {
    _instace ??= NavigationService._init();
    return _instace!;
  }

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final bool Function(Route<dynamic>) removeOldRoutes = (Route<dynamic> route) => false;

  Future<void> pushNamed(String path, {Object? arguments}) async {
    await navigatorKey.currentState!.pushNamed(path, arguments: arguments);
  }

  Future<void> pushNamedAndRemoveUntil(String path, {Object? arguments}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(path, removeOldRoutes, arguments: arguments);
  }

  Future<void> pushReplacementNamed(String path, {Object? arguments}) async {
    await navigatorKey.currentState!.pushReplacementNamed(path, arguments: arguments);
  }

  Future<void> pop() async {
    navigatorKey.currentState!.pop();
  }

  Future<void> maybePop() async {
    await navigatorKey.currentState!.maybePop();
  }
}
