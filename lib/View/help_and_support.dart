import 'package:b_designer_architecture/Controller/help_and_support_controller.dart';
import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpAndSupport extends StatelessWidget {
  HelpAndSupport({super.key});

  final HelpAndSupportController controller = Get.find<HelpAndSupportController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Help & Support", style: TextStyle(
              fontSize: 1.4.t,
              color: Colors.black,
              fontWeight: FontWeight.w600
            ),),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(helpAndSupportLabels.length, (index){
                final String label = helpAndSupportLabels[index];
                return Obx(()=>_buildLabel(title: label, onTap: ()=>controller.helpIndex.value = index, isSelected: controller.helpIndex.value == index));
              }),
            ),
            SizedBox(
              height: 30.0,
            ),
            Expanded(child: Obx(()=>controller.helpScreens[controller.helpIndex.value]))
          ],
        ),
      ),
    );
  }

  Widget _buildLabel({required String title, required VoidCallback onTap, required bool isSelected}){
    return IntrinsicWidth(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
              style: ButtonStyle(
                overlayColor: WidgetStatePropertyAll(Colors.transparent)
              ),
              onPressed: onTap, child: Text(title, style: TextStyle(
            fontSize: 1.t,
            color: Colors.black,
            fontWeight: FontWeight.w600
          ),)),
          Container(
            height: 3,
            color: isSelected ? Colors.black : Colors.black54,
          )
        ],
      ),
    );
  }

  final List<String> helpAndSupportLabels = [
    "Your Account",
    "Trust & Safety",
    "Payments & Withdrawals",
    "Order Management",
    "Regulations & Guidelines"
  ];

}
