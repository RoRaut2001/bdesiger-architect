import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/deals_controller.dart';

class DealsWidget extends StatelessWidget {
  final DealsController controller = Get.put(DealsController());

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => DropdownButtonHideUnderline(
        child: Container(
          margin: EdgeInsets.only(right: 30),
          width: 500,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black,width: 0.5),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButton<String>(
            value: controller.selectedOption.value,
            isExpanded: true,
            icon: const Icon(Icons.keyboard_arrow_down),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            dropdownColor: Colors.white,
            borderRadius: BorderRadius.circular(12),
            onChanged: (String? newValue) {
              if (newValue != null) {
                controller.updateSelection(newValue);
              }
            },
            items: controller.designOptions.map<DropdownMenuItem<String>>(
                  (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(value),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
