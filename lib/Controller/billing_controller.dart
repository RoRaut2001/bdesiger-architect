import 'package:b_designer_architecture/View/Screens/Others/billing_info.dart';
import 'package:b_designer_architecture/View/Screens/Others/payment_method.dart';
import 'package:get/get.dart';

class BillingController extends GetxController{


  var billingIndex = 0.obs;
  var billingScreens = [
    BillingInfo(),
    PaymentMethod()
  ].obs;

  var paymentMethods = <String>[].obs;
}