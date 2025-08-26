import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Controller/auth_controller.dart';

class LoginMobile extends StatelessWidget {
  LoginMobile({super.key});

  final AuthController controller = Get.find<AuthController>();

  RxBool isObscure = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Image.network("https://res.cloudinary.com/dculivch8/image/upload/v1733553206/official_logo_transparent_viocqf.png"),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Dream Spaces & Design Solutions', style: GoogleFonts.ubuntu(fontSize: 40,fontWeight: FontWeight.bold),),
              Text('Connecting consultant to endless opportunities, where creativity thrives. '
                  'Collaborate seamlessly with clients and showcase your expertise.'
                  'Join a platform designed to empower your vision and deliver excellence.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.ubuntu(fontSize: 12,fontWeight: FontWeight.normal),),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: emailScreen(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textField(TextEditingController controller, Widget prefixIcon, {bool isPassword = false, Widget? suffixIcon}){
    return TextFormField(
      style: GoogleFonts.inter(fontSize: 18),
      obscureText: isPassword ? isObscure.value : false,
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black)
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
        height: 45,
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
            color: Color(0xFFFFAE47)),
        ),)
      ],
    );
  }
  Widget emailScreen(BuildContext context){
    return Container(
      width: 475,
      decoration: BoxDecoration(
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40,),
          title("Enter your email"),
          subtitle("Forgot Password?", "Click Here", (){}),
          const SizedBox(height: 10,),
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
                const SizedBox(height: 20,),
                textField(controller.passwordController, IconButton(onPressed: (){}, icon: Icon(Icons.lock_outline)), isPassword: true, suffixIcon: Obx(()=>IconButton(onPressed: ()=>isObscure.value = !isObscure.value, icon: isObscure.value ? Icon(Icons.visibility) : Icon(Icons.visibility_off)))),
                const SizedBox(height: 20,),
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
