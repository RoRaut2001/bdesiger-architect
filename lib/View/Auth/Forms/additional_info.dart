import 'package:b_designer_architecture/Controller/auth_controller.dart';
import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Components/Buttons/submit_button.dart';

class AdditionalInfo extends StatelessWidget {
  final AuthController controller;
  const AdditionalInfo({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 30.0
      ),
      children: [
        // First question
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Colors.black
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Do you know the work of an Electrician?",
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),
              ),
              Obx(() => Column(
                children: [
                  RadioListTile(
                    title: Text('Yes', style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    ),),
                    value: 'Yes',
                    groupValue: controller.electricianWork.value,
                    onChanged: (value) {
                      controller.electricianWork.value = value as String;
                    },
                  ),
                  RadioListTile(
                    title: Text('No', style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    ),),
                    value: 'No',
                    groupValue: controller.electricianWork.value,
                    onChanged: (value) {
                      controller.electricianWork.value = value as String;
                    },
                  ),
                ],
              )),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Second question
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black
            ),
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Which machine do you use for work?",
                style: GoogleFonts.inter(
                    fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              ),
              Obx(() => Column(
                children: [
                  RadioListTile(
                    title: Text('Low End Laptop', style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    ),),
                    value: 'Low End Laptop',
                    groupValue: controller.workMachine.value,
                    onChanged: (value) {
                      controller.workMachine.value = value as String;
                    },
                  ),
                  RadioListTile(
                    title: Text('High End Laptop', style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    ),),
                    value: 'High End Laptop',
                    groupValue: controller.workMachine.value,
                    onChanged: (value) {
                      controller.workMachine.value = value as String;
                    },
                  ),
                  RadioListTile(
                    title:  Text('Low End PC',style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    ),),
                    value: 'Low End PC',
                    groupValue: controller.workMachine.value,
                    onChanged: (value) {
                      controller.workMachine.value = value as String;
                    },
                  ),
                  RadioListTile(
                    title: Text('High End PC', style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    ),),
                    value: 'High End PC',
                    groupValue: controller.workMachine.value,
                    onChanged: (value) {
                      controller.workMachine.value = value as String;
                    },
                  ),
                ],
              )),
            ],
          ),
        ),
        SizedBox(height: 25), // The spacing before the button
        Align(
          alignment: Alignment.topRight,
          child: SizedBox(
            width: 30.w,
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
    );
  }
}
