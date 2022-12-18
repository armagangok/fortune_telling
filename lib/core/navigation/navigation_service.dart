import 'package:flutter/material.dart';

import 'contract/base_navigation_service.dart';

class NavigationService extends NavigationServiceContract {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;
  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigateTo({required String path, Object? data}) async {
    try {
      await navigatorKey.currentState!.pushNamed(path, arguments: data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> navigaToClear({required String path, Object? data}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(
      path,
      removeAllOldRoutes,
      arguments: data,
    );
  }

  void getBack() => navigatorKey.currentState!.pop();
}
