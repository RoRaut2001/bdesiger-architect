import 'package:b_designer_architecture/View/Auth/Login/login.dart';
import 'package:b_designer_architecture/View/Auth/sign_up.dart';
import 'package:b_designer_architecture/View/Screens/chat_screen.dart';
import 'package:b_designer_architecture/View/Screens/project_details.dart';
import 'package:b_designer_architecture/View/homepage.dart';
import 'package:b_designer_architecture/View/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> routes = {
'/': (context) => SplashScreen(),
'/login': (context)=> Login(),
'/home': (context) => Homepage(),
'/signup': (context) => SignUp(),
'/project-details': (context) => ProjectDetails(),
'/chat': (context) => ChatScreen(),
};

