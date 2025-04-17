import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:b_designer_architecture/Components/Buttons/gender_button.dart';
import 'package:b_designer_architecture/Constants/constant_asset.dart';
import 'package:b_designer_architecture/Constants/constant_color.dart';
import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Controller/auth_controller.dart';
import '../../../Helper/Data/lists.dart';
import 'package:b_designer_architecture/Components/Buttons/submit_button.dart';

class BasicDetails extends StatelessWidget {
  final AuthController controller;

  BasicDetails({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    Widget buildField(String label, TextEditingController textController, String hintText,
        {TextInputType? keyboardType, List<TextInputFormatter>? inputFormatters}) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
                fontSize: 16, fontWeight: FontWeight.w600, color: kcGreyText),
          ),
          const SizedBox(height: 5),
          Container(
            height: 55,
            child: TextField(
              inputFormatters: inputFormatters,
              keyboardType: keyboardType,
              controller: textController,
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(
                      color: kcGreyText, fontSize: 16, fontWeight: FontWeight.w500),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black))),
            ),
          ),
        ],
      );
    }

    Widget buildGenderSelector() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Gender",
            style: GoogleFonts.inter(
                fontSize: 16, fontWeight: FontWeight.w600, color: kcGreyText),
          ),
          const SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0)),
            width: double.infinity,
            height: 55,
            child: Row(
              children: [
                Expanded(
                  child: Obx(() => GenderButton(
                      isSelected: controller.gender.value == "Male",
                      title: "Male",
                      icon: kaMaleLogo,
                      onTap: () => controller.gender.value = 'Male')),
                ),
                Expanded(
                  child: Obx(() => GenderButton(
                      isSelected: controller.gender.value == "Female",
                      title: "Female",
                      icon: kaFemaleLogo,
                      onTap: () => controller.gender.value = 'Female')),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget buildDropdown() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Position",
            style: GoogleFonts.inter(
                fontSize: 16, fontWeight: FontWeight.w600, color: kcGreyText),
          ),
          const SizedBox(height: 5),
          CustomDropdown(
              decoration: CustomDropdownDecoration(
                expandedBorderRadius: BorderRadius.circular(10.0),
                expandedBorder: Border.all(color: Colors.black, width: 0.5),
                closedBorder: Border.all(color: Colors.black, width: 0.5),
              ),
              hintText: "Select the option",
              items: positions,
              onChanged: (value) => controller.position.value = value!),
        ],
      );
    }

    List<Widget> fields = [
      buildField("First Name", controller.nameController, 'Enter first name', inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s]+$')),], keyboardType: TextInputType.name),
      buildDropdown(),
      buildGenderSelector(),
      buildField("State", controller.stateController, 'Enter your state', inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s]+$')),], keyboardType: TextInputType.name),
      buildField("City/Village", controller.villageController, 'Enter your city/village', inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s]+$')),], keyboardType: TextInputType.name),
    ];

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: isMobile
          ? ListView(
        children: [
          ...fields,
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
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 8,
              ),
              itemCount: fields.length,
              itemBuilder: (context, index) => fields[index],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 30.w,
            child: SubmitButton(
              title: "Continue",
              onTap: () {
                if(controller.nameController.text.isEmpty || controller.stateController.text.isEmpty || controller.villageController.text.isEmpty || controller.position.value.isEmpty){
                  Get.snackbar("Oops!", "All field are mandatory");
                }else{
                  if (controller.pageIndex.value < 4) {
                    controller.pageIndex.value += 1;
                  } else {
                    controller.registerArchitect(context);
                  }
                }
              },
              theme: "black",
            ),
          ),
        ],
      ),
    );
  }
}
