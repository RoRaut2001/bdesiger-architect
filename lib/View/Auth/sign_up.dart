import 'package:b_designer_architecture/Constants/constant_color.dart';
import 'package:b_designer_architecture/Controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import '../../Helper/Data/lists.dart';
import '../Screens/Sidebar/Others/services.dart';
import 'Forms/additional_info.dart';
import 'Forms/basic_details.dart';
import 'Forms/documents.dart';
import 'Forms/softwares.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final AuthController controller = Get.find<AuthController>();


  Future<bool> onWillPopScope() async {
    if (controller.pageIndex.value > 0) {
      controller.pageIndex.value -= 1;
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: onWillPopScope,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              width: screenWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [kcGradient1, kcGradient2],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 45),
                  InkWell(
                    onTap: (){
                      if (controller.pageIndex.value > 0) {
                        controller.pageIndex.value -= 1;
                      }
                      return;
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: kcGrey,
                      child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 15),
                  Obx(
                        () => Text(
                      signUpTitles[controller.pageIndex.value],
                      style: GoogleFonts.inter(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Text(
                    "This information helps us to build the best team.",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: kcLightGrey,
                    ),
                  ),
                ],
              ),
            ),
            Obx(
                  () => LinearProgressBar(
                maxSteps: 5,
                progressType: LinearProgressBar.progressTypeLinear,
                currentStep: controller.pageIndex.value + 1,
                progressColor: kcMediumYellow,
                backgroundColor: kcLightYellow,
                semanticsLabel: barTitle[controller.pageIndex.value],
                semanticsValue: barProgress[controller.pageIndex.value].toString(),
                minHeight: 20,
              ),
            ),
            Expanded(
              child: Obx(() {
                final pages = [
                  BasicDetails(controller: controller),
                  Services(),
                  Software(controller: controller),
                  AdditionalInfo(controller: controller),
                  Documents(controller: controller),
                ];
                return pages[controller.pageIndex.value];
              }),
            ),

            SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}
