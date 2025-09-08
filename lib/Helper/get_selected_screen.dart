import 'package:flutter/material.dart';
import 'package:b_designer_architecture/View/Screens/Home/home.dart';
import 'package:b_designer_architecture/View/Screens/Deals/deals.dart';
import 'package:b_designer_architecture/View/Screens/Sidebar/Analytics/analytics.dart';
import 'package:b_designer_architecture/View/Screens/Sidebar/Notification/notification.dart';

import '../View/Auth/Forms/services.dart';
import '../View/Screens/Sidebar/Others/About/about.dart';
import '../View/Screens/Sidebar/Others/Contanct/contact.dart';
import '../View/Screens/Sidebar/Others/Privacy Policy/privacy_policy.dart';
import '../View/Screens/Sidebar/Others/Terms Condition/terms_conditions.dart';

Widget getSelectedScreen(String selectedItem) {
  switch (selectedItem) {
    case 'Home':
      return Home();
    case 'Deals':
      return Deals();
    case 'Analytics':
      return Analytics();
    case 'Notifications':
      return NotificationScreen();
    case 'Other':
    case 'Services':
      return Services();
    case 'About':
      return About();
    case 'Contact':
      return Contact();
    case 'Privacy Policy':
      return PrivacyPolicy();
    case 'Terms & Condition':
      return TermsConditions();
    default:
      return const Center(child: Text("Select a Screen"));
  }
}
