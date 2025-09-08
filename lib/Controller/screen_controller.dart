import 'package:b_designer_architecture/Helper/Data/lists.dart';
import 'package:b_designer_architecture/View/Screens/billing_page.dart';
import 'package:b_designer_architecture/View/help_and_support.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../View/Auth/Forms/services.dart';
import '../View/Screens/Home/home.dart';
import '../View/Screens/Sidebar/Analytics/analytics.dart';
import '../View/Screens/Sidebar/Others/About/about.dart';
import '../View/Screens/Sidebar/Others/Contanct/contact.dart';
import '../View/Screens/Sidebar/Others/Privacy Policy/privacy_policy.dart';
import '../View/Screens/Sidebar/Others/Terms Condition/terms_conditions.dart';

class ScreenController extends GetxController {

  final List<Widget> iconList = List<Widget>.generate(4, (index) {
    return CachedNetworkImage(
      imageUrl: iconUrls[index],
      placeholder: (context, url) => alternateIconsList[index],
      errorWidget: (context, url, error) => alternateIconsList[index],
    );
  });
  final List queryItemIcons = <Widget>[
    Image.asset(
      'assets/images/general_queries.png',
      height: 23,
    ),
    Image.asset(
      'assets/images/form_fill.png',
      height: 25,
    ),
    Image.asset(
      'assets/images/consultant.png',
      height: 23,
    ),
    Image.asset(
      'assets/images/design_package.png',
      height: 23,
    ),
    Image.asset(
      'assets/images/payment.png',
      height: 23,
    ),
  ];
  final List<String> iconName = [
    'Home',
    'Deals',
    'Projects',
    'You',
  ];
  final List<String> queryIconName = [
    'General\nQueries',
    'Form\nFilling',
    'Online\nConsultant',
    'Design\nPackage',
    'Payment &\nRefund',
  ];
  var selectedScreen = 1.obs;
  var selectedQueryScreen = 0.obs;
  var screens = <Widget>[].obs;
  var selectedDealIndex = 0.obs;
  var dealLabels = ["New", "Pending", "Completed"];

  @override
  void onInit() {
    screens.value = [
      Home(),
      Analytics(),
      Services(),
      About(),
      Contact(),
      PrivacyPolicy(),
      TermsConditions(),
      BillingPage(),
      HelpAndSupport()
    ];
    super.onInit();
  }



}