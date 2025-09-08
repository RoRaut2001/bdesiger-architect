import 'package:b_designer_architecture/Helper/responsive.dart';
import 'package:b_designer_architecture/View/Screens/Sidebar/Others/Privacy%20Policy/privacy_policy_mobile.dart';
import 'package:b_designer_architecture/View/Screens/Sidebar/Others/Privacy%20Policy/privacy_policy_web.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(mobile: PrivacyPolicyMobile(), tablet: PrivacyPolicyMobile(), desktop: PrivacyPolicyWeb());
  }
}
