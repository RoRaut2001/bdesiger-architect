import 'package:b_designer_architecture/Controller/screen_controller.dart';
import 'package:b_designer_architecture/Controller/sidebar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popover/popover.dart';
import '../../../Components/Buttons/primary_button.dart';
import '../../../Controller/auth_controller.dart';
import '../../../Helper/get_selected_screen.dart';
import '../Sidebar/sidebar/sidebar.dart';

class DashboardWeb extends StatelessWidget {
  DashboardWeb({super.key});

  final AuthController authController = Get.find<AuthController>();
  final SidebarController sidebarController = Get.find<SidebarController>();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async{
          Navigator.pushNamed(context, '/dashboard');
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            titleSpacing: 0,
            automaticallyImplyLeading: false,
            title: Container(
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black, width: 0.5),),
              ),
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Image.asset(
                      'assets/images/bdesigner_official_logo_tranparent.png',
                      height: 42,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.notifications_none),
                    color: Colors.black87,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.help_outline),
                    color: Colors.black87,
                    onPressed: () {},
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, ",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF656565),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Obx(() => Text(
                        authController.userFirstName.value?? 'NA',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF656565),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                    ],
                  ),
                  const SizedBox(width: 10),
                  Builder(
                      builder: (context) {
                        return InkWell(
                            onTap: (){showPopUpOptions(context);},
                            child: Icon(Icons.account_circle, size: 28, color: Colors.black87));
                      }
                  ),
                  const SizedBox(width: 30),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body: Row(
            children: [
              Sidebar(),
              Expanded(
                child: Obx(() {
                  return Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFBF4),
                    ),
                    child: getSelectedScreen(sidebarController.selectedItem.value),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void showPopUpOptions(BuildContext context){
    showPopover(
        backgroundColor: Colors.transparent,
        arrowHeight: 0,
        shadow: [],
        arrowWidth: 0,
        barrierColor: Colors.transparent,
        radius: 5.0,
        context: context,
        bodyBuilder: (context){
          return Container(
            margin: EdgeInsets.only(right: 20),
            height: 110,
            width: 160,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: Colors.black, width: 0.5)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(left: 10, right: 5),
                  title:  Obx(() => Text(
                    authController.userFirstName.value ?? 'NA',
                    style: GoogleFonts.poppins(
                      color: Color(0xFF656565),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
                  subtitle:  Obx(() => Text(
                    authController.userData.value.email?? 'NA',
                    style: GoogleFonts.poppins(
                      color: Color(0xFF656565),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
                ),
                Divider(color: Color(0xFF8A8A8A), height: 1,),
                const SizedBox(height: 5,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: PrimaryButton(
                    title: "Logout",
                    onTap: (){authController.logout();},
                    isHollow: true,),
                ),
              ],
            ),
          );
        });
  }
}

