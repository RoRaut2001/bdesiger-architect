
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../Helper/responsive.dart';
import 'login_mobile.dart';
import 'login_web.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    log("Login Page appeared");
    return Responsive(
        mobile: LoginMobile(), tablet: LoginWeb(), desktop: LoginWeb());
  }
}
