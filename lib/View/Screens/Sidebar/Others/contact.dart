import 'package:b_designer_architecture/Helper/responsive.dart';
import 'package:b_designer_architecture/View/Screens/Mobile/Others/contact_mobile.dart';
import 'package:b_designer_architecture/View/Screens/Web/Others/contact_web.dart';
import 'package:flutter/material.dart';


class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(mobile: ContactMobile(), tablet: ContactMobile(), desktop: ContactWeb());
  }
}
