import 'package:b_designer_architecture/Helper/responsive.dart';
import 'package:b_designer_architecture/View/Screens/Mobile/Others/terms_conditions_mobile.dart';
import 'package:b_designer_architecture/View/Screens/Web/Others/terms_condition_web.dart';
import 'package:flutter/material.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(mobile: TermsConditionsMobile(), tablet: TermsConditionsMobile(), desktop: TermsConditionWeb());
  }
}
