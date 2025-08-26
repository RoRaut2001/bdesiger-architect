import 'dart:developer';
import 'package:b_designer_architecture/Helper/responsive.dart';
import 'package:b_designer_architecture/View/Auth/Login/login_web.dart';
import 'package:b_designer_architecture/View/Auth/Login/login_mobile.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    log("Login Page appeared");
    return Responsive(
        mobile: LoginMobile(), tablet: LoginWeb(), desktop: LoginWeb());
  }
}
