import 'package:get/get.dart';

import '../View/HelpAndSupport/your_account_support.dart';

class HelpAndSupportController extends GetxController{
  var helpIndex = 0.obs;

  var helpScreens = [
    YourAccountSupport()
  ].obs;

}