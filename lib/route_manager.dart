import 'package:b_designer_architecture/View/Auth/Login/login.dart';
import 'package:b_designer_architecture/View/Auth/sign_up.dart';
import 'package:b_designer_architecture/View/Screens/project_details.dart';
import 'package:b_designer_architecture/View/homepage.dart';
import 'package:flutter/material.dart';


class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => Login(),
          settings: settings,
        );
      case '/signup':
        return MaterialPageRoute(
          builder: (context) => SignUp(),
          settings: settings,
        );
      case '/home':
        return MaterialPageRoute(
          builder: (context) => Homepage(),
          settings: settings,
        );
      case '/project-details':
        return MaterialPageRoute(
          builder: (context) => ProjectDetails(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Login(),
          settings: settings,
        );
    }
  }
}