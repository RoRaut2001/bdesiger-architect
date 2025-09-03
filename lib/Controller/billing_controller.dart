import 'package:get/get.dart';
import '../View/Screens/Sidebar/Others/billing_info.dart';
import '../View/Screens/Sidebar/Others/payment_method.dart';

class BillingController extends GetxController{


  var billingIndex = 0.obs;
  var billingScreens = [
    BillingInfo(),
    PaymentMethod()
  ].obs;

  var paymentMethods = <String>[].obs;
}