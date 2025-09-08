import 'package:b_designer_architecture/Helper/responsive.dart';
import 'package:b_designer_architecture/View/Screens/Sidebar/Others/Billing%20Info/billing_mobile.dart';
import 'package:b_designer_architecture/View/Screens/Sidebar/Others/Billing%20Info/billing_web.dart';
import 'package:flutter/material.dart';


class BillingPage extends StatelessWidget {
  const BillingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(mobile: BillingMobile(), tablet: BillingMobile(), desktop: BillingWeb());
  }
}
