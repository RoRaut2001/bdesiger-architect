import 'package:b_designer_architecture/Controller/auth_controller.dart';
import 'package:b_designer_architecture/Helper/Data/lists.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../Components/Buttons/submit_button.dart';
import '../../../Components/Cards/signup_card.dart';

class Software extends StatelessWidget {
  final AuthController controller;

  const Software({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600; // Define breakpoints for responsiveness

    Widget buildGrid() {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isMobile ? 2 : 5, // Adjust grid layout for mobile and desktop
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 1, // Adjust aspect ratio for better spacing
        ),
        itemCount: softwares.length,
        itemBuilder: (context, index) {
          final software = softwares[index];
          return Obx(() => SignupCard(
            title: software['title']!,
            image: software['image']!,
            onTap: () {
              controller.selectedSoftwares.contains(software['title']!)
                  ? controller.selectedSoftwares.remove(software['title']!)
                  : controller.selectedSoftwares.add(software['title']!);
            },
            isSelected: controller.selectedSoftwares.contains(software['title']!),
          ));
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: isMobile
          ? SingleChildScrollView(
        child: Column(
          children: [
            buildGrid(),
            const SizedBox(height: 25),
            SubmitButton(
              title: "Continue",
              onTap: () {
                if (controller.pageIndex.value < 4) {
                  controller.pageIndex.value += 1;
                } else {
                  controller.registerArchitect(context);
                }
              },
              theme: "black",
            ),
          ],
        ),
      )
          : Column(
        children: [
          Expanded(child: buildGrid()),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 200,
              child: SubmitButton(
                title: "Continue",
                onTap: () {
                  if (controller.pageIndex.value < 4) {
                    controller.pageIndex.value += 1;
                  } else {
                    controller.registerArchitect(context);
                  }
                },
                theme: "black",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
