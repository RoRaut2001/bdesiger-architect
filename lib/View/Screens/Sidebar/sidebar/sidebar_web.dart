// Path: lib/View/Screens/Sidebar/sidebar/sidebar_web.dart

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Controller/sidebar_controller.dart';
import '../sidebar_item.dart';
import '../sidebar_menu_item.dart';

class SidebarWeb extends StatelessWidget {
  const SidebarWeb({super.key});

  @override
  Widget build(BuildContext context) {
    final SidebarController controller = Get.find<SidebarController>();

    return Drawer(
      elevation: 0,
      shape: const BeveledRectangleBorder(),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(right: BorderSide(color: Colors.black, width: 0.6)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Removed the Row with the logo and close button.
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: sidebarItems.length,
                itemBuilder: (context, index) {
                  final item = sidebarItems[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 7),
                    child: SidebarItem(
                      iconPath: item.iconPath,
                      label: item.label,
                      subItems: item.subItems,
                      onTap: () {
                        controller.selectItem(item.label);
                        log(item.label);
                        if (item.subItems != null) {
                          controller.toggleExpansion(item.label);
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}