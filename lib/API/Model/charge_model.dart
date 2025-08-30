import 'package:get/get.dart';

class ChargeItem {
  String label;
  RxDouble price;

  ChargeItem({required this.label, required double price})
      : price = price.obs;

  Map<String, dynamic> toJson() => {
    'label': label,
    'price': price.value,
  };
}

class ChargeSection {
  String sectionName;
  RxList<ChargeItem> items;

  ChargeSection({required this.sectionName, required List<ChargeItem> items})
      : items = items.obs;

  Map<String, dynamic> toJson() => {
    'sectionName': sectionName,
    'items': items.map((item) => item.toJson()).toList(),
  };
}
