import 'package:b_designer_architecture/Constants/constant_color.dart';
import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Components/Buttons/submit_button.dart';
import '../../../Controller/auth_controller.dart';

class LoginMobile extends StatelessWidget {
  LoginMobile({super.key});

  final AuthController controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Container(
                width: screenWidth,
                height: screenHeight * 0.50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      'BDesigner.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w800,
                        color: kcGreyText,
                        fontSize: 5.t,
                      ),
                    ),
                    Image.asset(
                      'assets/images/intro_img.png',
                      fit: BoxFit.cover,
                      width: screenWidth,
                    ),
                  ],
                ),
              ),
              Container(
                height: screenHeight * 0.50,
                width: MediaQuery.of(context).size.width,
                padding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 1.h),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [kcGradient1, kcGradient2],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 2.h),
                    Text(
                      'Build Your Dream Landing,Your Way.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.jost(
                          fontSize: 2.2.t, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 5, right: 10),
                            color: Colors.black,
                            height: 0.1.h,
                          ),
                        ),
                        SizedBox(width: 4.5.w),
                        Text(
                          'Quick • Affordable • Trusted',
                          style: GoogleFonts.jost(
                              fontSize: 1.8.t),
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 10, right: 5),
                            color: Colors.black,
                            height: 0.1.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h),
                    SizedBox(
                      height: 55,
                      child: TextField(
                        // controller: controller.phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          fillColor: Colors.white,
                          hintText: 'Mobile Number',
                          filled: true,
                          prefixIcon: InkWell(
                            onTap: (){
                              showModalBottomSheet(
                                  backgroundColor: Colors.white,
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context){
                                    return Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 20.0,
                                          horizontal: 15.0
                                      ),
                                      // child: Column(
                                      //   mainAxisSize: MainAxisSize.min,
                                      //   crossAxisAlignment: CrossAxisAlignment.start,
                                      //   // children: List.generate(countryCodes.length, (index)=>countryCodes[index]),
                                      // ),
                                    );
                                  });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  right: 10
                              ),
                              width: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0),
                                  ),
                                  border: BorderDirectional(
                                      end: BorderSide(
                                          color: Colors.black
                                      )
                                  )
                              ),
                              child: Obx(()=>Text(
                                  controller.selectedCode.value,
                                style: TextStyle(
                                  fontSize: 16
                                ),
                                  )),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: kcGradient1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    SubmitButton(
                      title: "Get OTP",
                      onTap: () async {
                        EasyLoading.show(
                          status: 'Sending OTP...',
                        );
                        await Future.delayed(Duration(seconds: 2));
                        EasyLoading.dismiss();
                        // Get.to(()=>OtpScreen(), transition: Transition.fadeIn);
                        // showSnackBar(
                        //   title: 'Success',
                        //   message: 'Otp sent successfully!',
                        // );
                      },
                      theme: "black",
                    ),
                    SizedBox(height: 10.h),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text:
                        'By proceeding you consent to share your information with\nBDesigner’s ',
                        style: GoogleFonts.inter(
                            fontSize: 1.5.t, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Privacy Policy',
                            style: GoogleFonts.inter(
                                fontSize: 1.5.t, color: Colors.lightBlue),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          TextSpan(
                            text: ' and ',
                            style: GoogleFonts.inter(
                                fontSize: 1.5.t, color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Terms of Service',
                            style: GoogleFonts.inter(
                                fontSize: 1.5.t, color: Colors.lightBlue),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          TextSpan(
                            text: '.',
                            style: GoogleFonts.inter(
                                fontSize: 1.5.t, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
