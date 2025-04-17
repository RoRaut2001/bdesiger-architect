import 'package:b_designer_architecture/Constants/constant_asset.dart';
import 'package:get/get.dart';
import 'package:b_designer_architecture/Controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginDesktop extends StatelessWidget {
  LoginDesktop({super.key});

  final AuthController controller = Get.find<AuthController>();

  RxBool isObscure = false.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(kaLoginBack), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(child: emailScreen(context)),
      ),
    );
  }

  Widget textField(TextEditingController controller, Widget prefixIcon, {bool isPassword = false, Widget? suffixIcon}){
    return TextFormField(
        style: GoogleFonts.inter(
          fontSize: 18
        ),
        obscureText: isPassword ? isObscure.value : false,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black
                )
            ),
            prefixIcon: prefixIcon
        ),
      );
  }
  Widget submitButton(String title, VoidCallback onTap){
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        alignment: Alignment.center,
        height: 55,
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Color(0xFFFFAE47)
        ),
        child: Text(title, style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 18
        ),),
      ),
    );
  }
  Widget logoImage(){
    return Image.network("https://res.cloudinary.com/dculivch8/image/upload/v1733553206/official_logo_transparent_viocqf.png", height: 55, width: 128,);
  }
  Widget title(String title) {
    return Text(title, style: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 26,
        color: Colors.black
    ),);
  }
  Widget subtitle(String firstText, String secondText, VoidCallback onTap){
    return Row(
      children: [
        Text(firstText, style: GoogleFonts.inter(
            fontSize: 12,
            color: Colors.black
        ),),
        TextButton(
          style: ButtonStyle(
              padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 5))
          ),
          onPressed: onTap, child: Text(secondText, style: GoogleFonts.inter(fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Color(0xFFFFAE47)
        ),),)
      ],
    );
  }
  Widget emailScreen(BuildContext context){
    return Container(
      padding: EdgeInsets.all(25.0),
      width: 475,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          logoImage(),
          SizedBox(
            height: 40,
          ),
          title("Enter your email"),
          subtitle("Forgot Password?", "Click Here", (){}),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
                vertical: 30.0,
                horizontal: 15.0
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                    color: Color(0xFFBCBCBC)
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textField(controller.emailController, Icon(Icons.email, color: Colors.black,)),
                SizedBox(height: 20,),
                textField(controller.passwordController, IconButton(onPressed: (){}, icon: Icon(Icons.password_rounded)), isPassword: true, suffixIcon: Obx(()=>IconButton(onPressed: ()=>isObscure.value = !isObscure.value, icon: isObscure.value ? Icon(Icons.visibility) : Icon(Icons.visibility_off)))),
                SizedBox(height: 20,),
                Obx(()=> controller.isLoading.value ? Center(child: CircularProgressIndicator(color: Colors.orange, strokeCap: StrokeCap.round,),) : submitButton("Login", (){
                  controller.login(context);
                })),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
