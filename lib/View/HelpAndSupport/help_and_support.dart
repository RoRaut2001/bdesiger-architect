import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Controller/screen_controller.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({super.key});

  @override
  Widget build(BuildContext context) {
    final ScreenController controller = Get.find();

    final List<String> tabs = [
      "Your Account",
      "Trust & Safety",
      "Payments & Withdrawals",
      "Order Management",
      "Regulations & Guidelines",
    ];

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, '/dashboard');
        return false;
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Help & Support', style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500
            ),),
            Obx(() => SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 15),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(tabs.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: _buildTabItem(
                      title: tabs[index],
                      index: index,
                      controller: controller,
                    ),
                  );
                }),
              ),
            )),
            Expanded(
              child: Obx(()=> controller.getSelectedHelpCenterTab()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({required String title, required int index, required ScreenController controller}) {
    bool isSelected = controller.selectedHelpCenterOption.value == index;

    return GestureDetector(
      onTap: () => controller.changeHelpCenterTab(index),
      child: Column(
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: isSelected ? Colors.black : Colors.black.withOpacity(0.5),
            ),
          ),
          SizedBox(height: 3),
          Container(
            height: 1,
            width: 80,
            color: isSelected ? Colors.black : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
