import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popover/popover.dart';
import '../../../Components/Buttons/primary_button.dart';
import '../../../Controller/auth_controller.dart';
import '../../../Controller/sidebar_controller.dart';
import '../../../Helper/get_selected_screen.dart';
import '../Sidebar/sidebar/sidebar_mobile.dart';

class DashboardMobile extends StatelessWidget {
  DashboardMobile({super.key});

  final AuthController authController = Get.find<AuthController>();
  final SidebarController sidebarController = Get.find<SidebarController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.pushNamed(context, '/dashboard');
        return false;
      },
      child: Scaffold(
        drawer: const SidebarMobile(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu_rounded, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          titleSpacing: 0,
          title: Row(
            children: [
              Image.asset(
                'assets/images/bdesigner_official_logo_tranparent.png',
                height: kToolbarHeight * 0.5,
                fit: BoxFit.cover,
              ),
              Spacer(),
              IconButton(
                icon: const Icon(Icons.notifications_none, size: 17,),
                color: Colors.black87,
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () { },
              ),
              SizedBox(width: 9,),
              IconButton(
                icon: const Icon(Icons.help_outline, size: 17,),
                color: Colors.black87,
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  Navigator.pushNamed(context, '/help-support');
                },
              ),
              const SizedBox(width: 9,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, ",
                    style: GoogleFonts.outfit(
                      color: Color(0xFF656565),
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Obx(() => Text(
                    authController.userFirstName.value,
                    style: GoogleFonts.outfit(
                      color: Color(0xFF656565),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
                ],
              ),
              const SizedBox(width: 8),
              Builder(
                  builder: (context) {
                    return InkWell(
                        onTap: (){showPopUpOptions(context);},
                        child: Icon(Icons.account_circle, size: 28, color: Colors.black87));
                  }
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
        body: Obx(() {
          return getSelectedScreen(sidebarController.selectedItem.value);
        }),
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
                    title: "Logout", onTap: (){
                    authController.logout();
                  }, isHollow: true,),
                ),
              ],
            ),
          );
        });
  }
}
