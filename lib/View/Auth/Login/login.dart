import 'package:b_designer_architecture/Helper/responsive.dart';
import 'package:b_designer_architecture/View/Auth/Login/login_desktop.dart';
import 'package:b_designer_architecture/View/Auth/Login/login_mobile.dart';
import 'package:flutter/material.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(mobile: LoginMobile(), tablet: LoginDesktop(), desktop: LoginDesktop());
  }
}
