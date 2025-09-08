import 'package:get/get.dart';

class SidebarController extends GetxController {
  var selectedItem = 'Home'.obs;

  var expandedItem = ''.obs;

  void toggleExpansion(String label) {
    expandedItem.value = (expandedItem.value == label) ? '' : label;
  }
  bool isExpanded(String label) => expandedItem.value == label;

  void selectItem(String label) {
    selectedItem.value = label;
    if (label != 'Other') {
      clearExpansion();
    }
  }

  bool isSelected(String label) => selectedItem.value == label;

  void clearExpansion() {
    expandedItem.value = '';
  }
}
