import 'package:get/get.dart';

class SidebarController extends GetxController {
  /// Currently selected sidebar item
  var selectedItem = 'Home'.obs;

  /// Track expanded item
  var expandedItem = ''.obs;

  /// Toggle the expansion state of a specific item
  void toggleExpansion(String label) {
    expandedItem.value = (expandedItem.value == label) ? '' : label;
  }

  bool isExpanded(String label) => expandedItem.value == label;

  /// Handle item selection
  void selectItem(String label) {
    selectedItem.value = label;
    if (label != 'Other') {
      clearExpansion();
    }
  }

  bool isSelected(String label) => selectedItem.value == label;

  /// Collapse all expanded items
  void clearExpansion() {
    expandedItem.value = '';
  }
}
