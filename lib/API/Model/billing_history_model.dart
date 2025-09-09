class BillingServiceModel {
  final String name;
  final int orderValue;
  final double gst;
  final int total;

  BillingServiceModel({
    required this.name,
    required this.orderValue,
    required this.gst,
    required this.total,
  });
}

class BillingOrderModel {
  final String orderId;
  final List<BillingServiceModel> services;
  final double platformCommission;
  final String status;
  final String date;

  BillingOrderModel({
    required this.orderId,
    required this.services,
    required this.platformCommission,
    required this.status,
    required this.date,
  });
}