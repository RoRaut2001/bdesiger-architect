import 'package:b_designer_architecture/Components/Cards/signup_card.dart';
import 'package:b_designer_architecture/Controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Helper/Data/lists.dart';
import 'package:b_designer_architecture/Components/Buttons/submit_button.dart';

class Services extends StatelessWidget {
  final AuthController controller;

  const Services({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600; // Define breakpoints for responsiveness

    Widget buildGrid() {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isMobile ? 2 : 4, // Adjust grid layout for mobile and desktop
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 1, // Adjust aspect ratio for better spacing
        ),
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return Obx(() => SignupCard(
            title: service['title']!,
            image: "assets/images/Services/img1.png",
            onTap: () {
              controller.selectedServices.contains(service['title']!)
                  ? controller.selectedServices.remove(service['title']!)
                  : controller.selectedServices.add(service['title']!);
            },
            isSelected: controller.selectedServices.contains(service['title']!),
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
              width: 200, // Fixed width for the button on desktop
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
