import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Controller/sidebar_controller.dart';

class SidebarItemMobile extends StatelessWidget {
  final String iconPath;
  final String label;
  final List<String>? subItems;
  final VoidCallback? onTap;

  SidebarItemMobile({
    super.key,
    required this.iconPath,
    required this.label,
    this.subItems,
    this.onTap,
  });


  final SidebarController controller = Get.find<SidebarController>();

  @override
  Widget build(BuildContext context) {
    final hasSubItems = subItems != null && subItems!.isNotEmpty;

    return Obx(() {
      final isExpanded = controller.isExpanded(label);
      final isSelected = controller.isSelected(label);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              if (onTap != null) {
                onTap!();
              } else {
                _handleItemTap(context);
              }
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFECECEC) : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 25),
                    child: SvgPicture.asset(iconPath, color: Colors.black, width: 20,height: 20,),
                  ),
                  Expanded(
                    child: Text(
                      label,
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  if (hasSubItems)
                    Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                ],
              ),
            ),
          ),
          if (hasSubItems && isExpanded)
            Padding(
              padding: const EdgeInsets.only(left: 60, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: subItems!
                    .map((subItem) => GestureDetector(
                  onTap: () {
                    controller.selectItem(subItem);
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      subItem,
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ))
                    .toList(),
              ),
            ),
        ],
      );
    });
  }

  void _handleItemTap(BuildContext context) {
    if (subItems != null) {
      controller.toggleExpansion(label);
      controller.selectItem(label);
    } else {
      controller.selectItem(label);
      controller.clearExpansion();
      Navigator.pop(context);
    }
  }
}
