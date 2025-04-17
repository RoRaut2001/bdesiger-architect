import 'package:b_designer_architecture/Constants/constant_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/screen_controller.dart';

class BottomBar extends StatelessWidget {
  BottomBar({super.key});

  final ScreenController screenController = Get.find<ScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      alignment: Alignment.center,
      height: 90,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 2.9,
            color: Colors.black.withOpacity(0.25)),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(screenController.iconList.length, (index) {
          return Obx(() => InkWell(
            onTap: () {
              screenController.selectedScreen.value = index;
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: screenController.selectedScreen.value == index
                        ? LinearGradient(
                      colors: [kcGradient1, kcGradient2],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )
                        : null,
                  ),
                  child: screenController.iconList[index],
                ),
                Text(screenController.iconName[index]),
              ],
            ),
          ));
        }),
      ),
    );
  }
}