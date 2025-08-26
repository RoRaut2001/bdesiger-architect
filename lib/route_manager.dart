import 'package:flutter/material.dart';

import 'View/Auth/Login/login.dart';
import 'View/Screens/Dashboard/dashboard.dart';
import 'View/Screens/chat_screen.dart';
import 'View/temp.dart';
import 'auth_wrapper.dart';


class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(
          builder: (context) => Login(),
          settings: settings,
        );
        case '/temp':
        return MaterialPageRoute(
          builder: (context) => Temp(),
          settings: settings,
        );
      case '/auth':
        return MaterialPageRoute(
          builder: (context) => AuthWrapper(),
          settings: settings,
        );
      // case '/architect-table':
      //   return MaterialPageRoute(
      //     builder: (context) => ArchitectTablePage(),
      //     settings: settings,
      //   );
      case '/dashboard':
        return MaterialPageRoute(
          builder: (context) => Dashboard(),
          settings: settings,
        );
      case '/chat':
        return MaterialPageRoute(
          builder: (context) => ChatScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Container(
            child: Text('404 Page not found'),
          ),
          settings: settings,
        );
    }
  }
}