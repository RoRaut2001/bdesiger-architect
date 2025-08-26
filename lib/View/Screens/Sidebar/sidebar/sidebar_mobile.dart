import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:b_designer_architecture/View/Screens/Sidebar/sidebar_item_mobile.dart';
import 'package:b_designer_architecture/View/Screens/Sidebar/sidebar_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Controller/sidebar_controller.dart';

class SidebarMobile extends StatelessWidget {
  const SidebarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final SidebarController controller = Get.find<SidebarController>();

    return Drawer(
      backgroundColor: Colors.white,
      width: 80.w,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Image.asset('assets/images/bdesigner_official_logo_tranparent.png', width: 70),
                ),
                IconButton(
                  icon: const Icon(Icons.close, size: 20),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          // Menu items list
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(15),
              children: sidebarItems.map((item) {
                return SidebarItemMobile(
                  iconPath: item.iconPath,
                  label: item.label,
                  subItems: item.subItems,
                  onTap: () {
                    controller.selectItem(item.label);
                    if (item.subItems != null) {
                      controller.toggleExpansion(item.label);
                    } else {
                      Navigator.pop(context);
                    }
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
