import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../API/Model/billing_history_model.dart';
import '../View/Screens/Sidebar/Billing/Billing Info/billing_info.dart';
import '../View/Screens/Sidebar/Billing/History/billing_history.dart';
import '../View/Screens/Sidebar/Others/Payment Method/payment_method.dart';

class BillingController extends GetxController {

  var billingIndex = 0.obs;

  /// Screens for billing tabs
  List<Widget> get billingScreens => [
    BillingHistory(),
    BillingInfo(),
    PaymentMethod(),
  ];

  var paymentMethods = <String>[].obs;
  var isLoading = true.obs;
  var orders = <BillingOrderModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMockData();
  }

  void fetchMockData() async {
    await Future.delayed(const Duration(seconds: 1));
    orders.value = [
      BillingOrderModel(
        orderId: "BDVA001",
        platformCommission: 0.35,
        status: "Paid",
        date: "25/02/25",
        services: [
          BillingServiceModel(name: "2D Floor Plan", orderValue: 2000, gst: 0.18, total: 1800),
          BillingServiceModel(name: "3D Elevation", orderValue: 2500, gst: 0.18, total: 1750),
          BillingServiceModel(name: "Interior Design", orderValue: 4500, gst: 0.18, total: 4000),
        ],
      ),
      BillingOrderModel(
        orderId: "BDVA002",
        platformCommission: 0.35,
        status: "Pending",
        date: "26/02/25",
        services: [
          BillingServiceModel(name: "2D Floor Plan", orderValue: 3000, gst: 0.18, total: 1700),
          BillingServiceModel(name: "3D Elevation", orderValue: 3000, gst: 0.18, total: 1700),
          BillingServiceModel(name: "Interior Design", orderValue: 4000, gst: 0.18, total: 1600),
        ],
      ),
      BillingOrderModel(
        orderId: "BDVA003",
        platformCommission: 0.35,
        status: "Pending",
        date: "26/02/25",
        services: [
          BillingServiceModel(name: "2D Floor Plan", orderValue: 3000, gst: 0.18, total: 1700),
          BillingServiceModel(name: "3D Elevation", orderValue: 3000, gst: 0.18, total: 1700),
          BillingServiceModel(name: "Interior Design", orderValue: 4000, gst: 0.18, total: 1600),
        ],
      ),
      BillingOrderModel(
        orderId: "BDVA004",
        platformCommission: 0.35,
        status: "Pending",
        date: "26/02/25",
        services: [
          BillingServiceModel(name: "2D Floor Plan", orderValue: 3000, gst: 0.18, total: 1700),
          BillingServiceModel(name: "3D Elevation", orderValue: 3000, gst: 0.18, total: 1700),
          BillingServiceModel(name: "Interior Design", orderValue: 4000, gst: 0.18, total: 1600),
        ],
      ),
    ];
    isLoading.value = false;
  }
}
