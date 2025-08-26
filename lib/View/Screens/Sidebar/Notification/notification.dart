import 'package:b_designer_architecture/View/Screens/Sidebar/Notification/notification_mobile.dart';
import 'package:b_designer_architecture/View/Screens/Sidebar/Notification/notification_tab.dart';
import 'package:b_designer_architecture/View/Screens/Sidebar/Notification/notification_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Controller/screen_controller.dart';
import '../../../../Helper/responsive.dart';

class NotificationScreen extends StatelessWidget {
   NotificationScreen({super.key});
   final ScreenController controller = Get.find<ScreenController>();

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: NotificationMobile(),
        tablet: NotificationWeb(),
        desktop: NotificationTab());
  }
}
