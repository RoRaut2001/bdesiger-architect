import 'package:b_designer_architecture/Components/Buttons/primary_button.dart';
import 'package:b_designer_architecture/Constants/constant_asset.dart';
import 'package:b_designer_architecture/Controller/auth_controller.dart';
import 'package:b_designer_architecture/Controller/screen_controller.dart';
import 'package:b_designer_architecture/Helper/Data/setter_fields.dart';
import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:b_designer_architecture/View/Screens/profile.dart';
import 'package:b_designer_architecture/View/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popover/popover.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Appbar extends StatefulWidget implements PreferredSizeWidget {
  Appbar({super.key});

  @override
  State<Appbar> createState() => _AppbarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(70);
}


class _AppbarState extends State<Appbar> {
  final ScreenController screenController = Get.find<ScreenController>();

  final AuthController controller = Get.find<AuthController>();
  String name = "NA";

  @override
  void initState() {
    loadName();
    super.initState();
  }

  void loadName() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? fetchedName = sharedPreferences.getString("firstname");
    if (mounted) {
      setState(() {
        name = fetchedName ?? "User";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: BorderDirectional(
          bottom: BorderSide(
            color: Colors.black
          )
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 60,),
          Image.asset(kaAppbarLogo, width: 150,),
          Spacer(),
          SizedBox(
            height: 30,
            width: 30,
            child: Stack(
              children: [
                Positioned(
                    child: Image.asset(kaNotifications, height: 20,),
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                ),
                Positioned(
                  top: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.redAccent
                    )
                )
              ],
            ),
          ),
          SizedBox(
            width: 3.w,
          ),
          SizedBox(
            width: 20.w,
            child: ListTile(
              title: Text("Hello,",
                style: TextStyle(
                fontSize: 0.9.t,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6C6C6C)
              ),),
              subtitle: Text(name.split(" ")[0],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 1.2.t,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6C6C6C)
              ),),
              trailing: Builder(
                builder: (context) {
                  return InkWell(
                    onTap: (){
                      showPopUpOptions(context);
                    },
                    child: CircleAvatar(
                        backgroundColor: Colors.black87,
                        child: Icon(Icons.person, color: Colors.white,)),
                  );
                }
              ),
            ),
          )
        ],
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
        radius: 10.0,
        context: context,
        bodyBuilder: (context){
      return Container(
        margin: EdgeInsets.only(
          right: 20
        ),
        height: 30.h,
        width: 40.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.black,
            width: 0.5
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(name, style: GoogleFonts.outfit(
                fontSize: 1.3.t,
                color: Color(0xFF8A8A8A),
                fontWeight: FontWeight.w500
              ),),
              // subtitle: Text("rajeshgupta@gmail.com", style: GoogleFonts.outfit(
              //     fontSize: 0.8.t,
              //     color: Color(0xFF8A8A8A),
              //     fontWeight: FontWeight.w500
              // ),),
            ),
            Divider(color: Color(0xFF8A8A8A),),
            SizedBox(height: 20.0,),
            ListTile(
              onTap: (){
                Get.back();
                Get.to(() => Profile(controller: Get.find()));
              },
              title: Text("Your Profile", style: GoogleFonts.outfit(
                  fontSize: 0.9.t,
                  color: Colors.black,
                  fontWeight: FontWeight.w500
              ),),
              trailing: Icon(Icons.arrow_forward_ios_rounded, color:  Colors.black, size: 12,),
            ),
            ListTile(
              onTap: (){
                Get.back();
                index.value = 8;
              },

              title: Text("Balance", style: GoogleFonts.outfit(
                  fontSize: 0.9.t,
                  color: Colors.black,
                  fontWeight: FontWeight.w500
              ),),
              trailing: Icon(Icons.arrow_forward_ios_rounded, color:  Colors.black, size: 12,),
            ),
            ListTile(
              onTap: (){
                Get.back();
                Get.to(() => SettingPage());
                },
              title: Text("settings", style: GoogleFonts.outfit(
                  fontSize: 0.9.t,
                  color: Colors.black,
                  fontWeight: FontWeight.w500
              ),),
              trailing: Icon(Icons.arrow_forward_ios_rounded, color:  Colors.black, size: 12,),
            ),
            ListTile(
              onTap: ()=>index.value = 9,
              title: Text("Help & Support", style: GoogleFonts.outfit(
                  fontSize: 0.9.t,
                  color: Colors.black,
                  fontWeight: FontWeight.w500
              ),),
              trailing: Icon(Icons.arrow_forward_ios_rounded, color:  Colors.black, size: 12,),
            ),
            ListTile(
              title: Text("Refer your partner", style: GoogleFonts.outfit(
                  fontSize: 0.9.t,
                  color: Colors.black,
                  fontWeight: FontWeight.w500
              ),),
              trailing: Icon(Icons.arrow_forward_ios_rounded, color:  Colors.black, size: 12,),
            ),
            Spacer(),
            Divider(color: Color(0xFF8A8A8A),),
            SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment.center,
                child: PrimaryButton(title: "Logout", onTap: (){
                  controller.logout();
                }, isHollow: true,)),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    });
  }

}
