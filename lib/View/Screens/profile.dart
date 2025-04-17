import 'package:b_designer_architecture/Controller/auth_controller.dart';
import 'package:b_designer_architecture/Controller/screen_controller.dart';
import 'package:b_designer_architecture/Helper/responsive.dart';
import 'package:b_designer_architecture/View/Screens/Mobile/profile_mobile.dart';
import 'package:b_designer_architecture/View/Screens/Web/profile_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  final ScreenController controller;
  Profile({super.key, required this.controller});

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {

    return Responsive(mobile: ProfileMobile(), tablet: ProfileWeb(), desktop: ProfileWeb());
  }
}
