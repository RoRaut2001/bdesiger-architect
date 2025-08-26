import 'package:b_designer_architecture/View/Auth/Login/login.dart';
import 'package:b_designer_architecture/View/Auth/sign_up.dart';
import 'package:b_designer_architecture/View/Screens/Dashboard/dashboard.dart';
import 'package:b_designer_architecture/View/Screens/chat_screen.dart';
import 'package:b_designer_architecture/View/Screens/project_details.dart';
import 'package:b_designer_architecture/View/temp.dart';
import 'package:b_designer_architecture/auth_wrapper.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> routes = {
'/auth': (context)=> AuthWrapper(),
'/login': (context) => Login(),
'/temp': (context) => Temp(),
'/dashboard': (context) => Dashboard(),
'/signup': (context) => SignUp(),
'/project-details': (context) => ProjectDetails(),
'/chat': (context) => ChatScreen(),
};

