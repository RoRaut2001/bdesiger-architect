import 'package:b_designer_architecture/Controller/auth_controller.dart';
import 'package:b_designer_architecture/Helper/responsive.dart';
import 'package:b_designer_architecture/View/Screens/Mobile/analytics_mobile.dart';
import 'package:b_designer_architecture/View/Screens/Web/analytics_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Analytics extends StatelessWidget {
  Analytics({super.key});

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {

    getRatings();

    return Responsive(mobile: AnalyticsMobile(), tablet: AnalyticsWeb(), desktop: AnalyticsWeb());
  }
  Future<void> getRatings() async{
    WidgetsBinding.instance.addPostFrameCallback((_){
      authController.getMyRatings();
    });
  }
}
