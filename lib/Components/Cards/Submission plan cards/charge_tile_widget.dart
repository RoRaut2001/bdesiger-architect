import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../API/Model/charge_model.dart';

class ChargeTileWidget extends StatelessWidget {
  final ChargeItem item;

  const ChargeTileWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final TextEditingController editingController = TextEditingController();

    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.centerLeft,
            height: 100,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5),
              borderRadius: const BorderRadius.horizontal(left: Radius.circular(5)),
              color: Colors.white,
            ),
            child: Text(item.label, overflow: TextOverflow.ellipsis),
          ),
        ),
        Expanded(
          flex: 1,
          child: Obx(() {
            editingController.text = item.price.value.toStringAsFixed(item.price.value % 1 == 0 ? 1 : _getDecimalPlaces(item.price.value));
            editingController.selection = TextSelection.fromPosition(
              TextPosition(offset: editingController.text.length),
            );
            return Container(
              alignment: Alignment.centerLeft,
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.5),
                borderRadius: const BorderRadius.horizontal(right: Radius.circular(5)),
                color: const Color(0xFFF3F3F3),
              ),
              child: TextField(
                textAlign: TextAlign.center,
                controller: editingController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'))],
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixText: 'Rs.',
                  prefixStyle: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500),
                ),
                onChanged: (val) {
                  double? parsed = double.tryParse(val);
                  if (parsed != null && parsed != item.price.value) {
                    item.price.value = parsed;
                  }
                },
              ),
            );
          }),
        ),
      ],
    );
  }

  int _getDecimalPlaces(double value) {
    final String str = value.toString();
    final int decimalPointIndex = str.indexOf('.');
    return decimalPointIndex == -1 ? 0 : str.length - decimalPointIndex - 1;
  }
}
