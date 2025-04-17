import 'package:flutter/material.dart';
import 'dart:html' as html;

class MyRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  String? previousRouteName;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (previousRoute != null) {
      previousRouteName = previousRoute.settings.name;
      // Update the URL without the hash
      html.window.history.pushState(null, '', previousRouteName != null ? previousRouteName : '');
    }
    super.didPush(route, previousRoute);
  }
}