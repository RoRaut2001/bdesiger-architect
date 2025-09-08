import 'package:b_designer_architecture/Helper/responsive.dart';
import 'package:b_designer_architecture/View/Screens/Sidebar/Billing/billing%20page/billing_mobile.dart';
import 'package:b_designer_architecture/View/Screens/Sidebar/Billing/billing%20page/billing_page_tab.dart';
import 'package:flutter/material.dart';

import 'billing_web.dart';


class BillingPage extends StatelessWidget {
  const BillingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: BillingMobile(),
        tablet: BillingTab(),
        desktop: BillingWeb());
  }
}
