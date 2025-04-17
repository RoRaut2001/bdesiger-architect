// import 'package:b_designer_architecture/Components/Buttons/submit_button.dart';
// import 'package:b_designer_architecture/Components/Cards/trapezoidal_container.dart';
// import 'package:b_designer_architecture/Components/TextFields/opatic_field.dart';
// import 'package:b_designer_architecture/Model/country_code.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:b_designer_architecture/Controller/auth_controller.dart';
// import 'package:b_designer_architecture/Helper/size_config.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:pinput/pinput.dart';
// import 'package:timer_count_down/timer_count_down.dart';
//
// class LoginDesktop extends StatelessWidget {
//   LoginDesktop({super.key});
//
//   final AuthController controller = Get.find<AuthController>();
//
//   final defaultPinTheme = PinTheme(
//     width: 40,
//     height: 40,
//     textStyle: TextStyle(
//       fontSize: 20,
//       color: Colors.black,
//       fontWeight: FontWeight.w400,
//     ),
//     decoration: BoxDecoration(
//       border: Border.all(color: Colors.grey),
//       borderRadius: BorderRadius.circular(10),
//     ),
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Row(
//         children: [
//           Expanded(
//             flex: 2,
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: TrapezoidalContainer(),
//             ),
//           ),
//           Expanded(
//               flex: 1,
//               child: Container(
//                 padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CachedNetworkImage(
//                       imageUrl:
//                       "https://res.cloudinary.com/dculivch8/image/upload/v1733553206/official_logo_transparent_viocqf.png",
//                       height: 3.h,
//                     ),
//                     SizedBox(
//                       height: 4.h,
//                     ),
//                     Align(
//                       alignment: Alignment.center,
//                       child: Text(
//                         "Hi Designer",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: 2.5.t, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.center,
//                       child: Text(
//                         "Welcome to B Designer",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: 1.t),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 3.h,
//                     ),
//                     Align(
//                       alignment: Alignment.center,
//                       child: SizedBox(
//                         width: 50.w,
//                         child: OpaticField(
//                           controller: controller.phoneController,
//                           hintText: "Enter Phone number",
//                           keyboardType: TextInputType.phone,
//                           inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                           isEnforced: true,
//                           prefix: InkWell(
//                             onTap: (){
//                               final List<CountryCode> codes = [
//                                 CountryCode(code: "+91", country: "India", flag: "flag"),
//                                 CountryCode(code: "+1", country: "USA", flag: "flag"),
//                                 CountryCode(code: "+74", country: "Nepal", flag: "flag"),
//                                 CountryCode(code: "+104", country: "Bangladesh", flag: "flag"),
//                               ];
//                               showModalBottomSheet(
//                                   backgroundColor: Colors.white,
//                                   context: context,
//                                   builder: (context){
//                                     return ListView.builder(
//                                         itemCount: codes.length,
//                                         itemBuilder: (context, index){
//                                           final CountryCode code = codes[index];
//                                           return ListTile(
//                                             onTap: (){
//                                               Navigator.pop(context);
//                                               controller.selectedCode.value = code.code;
//                                             },
//                                             leading: Text(code.code),
//                                             title: Text(code.country),
//                                           );
//                                         });
//                                   });
//                             },
//                             child: Container(
//                                 alignment: Alignment.center,
//                                 width: 8  .w,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(15.0),
//                                     bottomLeft: Radius.circular(15.0),
//                                   ),
//                                 ),
//                                 child: Obx(()=>Text(controller.selectedCode.value, style: TextStyle(
//                                     fontSize: 16
//                                 ),))
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 2.h,
//                     ),
//                     Align(
//                       alignment: Alignment.center,
//                       child: Obx(() {
//                         if (controller.otpSent.value) return Pinput(
//                           defaultPinTheme: defaultPinTheme,
//                           length: 6,
//                           onCompleted: (pin) {
//                             if (pin.length == 6) {
//                               controller.otp.value = pin;
//                             }
//                           },
//                         );
//                         else{
//                           return Container();
//                         }
//                       }),
//                     ),
//                     SizedBox(
//                       height: 2.h,
//                     ),
//                     Divider(
//                       endIndent: 15.w,
//                       indent: 15.w,
//                       color: Colors.black,
//                     ),
//                     SizedBox(
//                       height: 1.h,
//                     ),
//                     Obx(() => controller.otpSent.value
//                         ? controller.timerFinished.value
//                         ? InkWell(
//                       onTap: () {
//                         if (controller.phoneController.text.length > 10) {
//                           Get.snackbar("Oops!", "Please enter a valid mobile number");
//                           return;
//                         }
//                         controller.sendOtp();
//                       },
//                       child: SizedBox(
//                         height: 50,
//                         child: Text("Resend OTP"),
//                       ),
//                     )
//                         : Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text("You can resend OTP in "),
//                         Countdown(
//                           controller: controller.countDownController,
//                           seconds: 30,
//                           build: (BuildContext context, double time) =>
//                               Text(time.toInt().toString()),
//                           onFinished: () {
//                             controller.timerFinished.value = true;
//                           },
//                         ),
//                         Text(" Seconds"),
//                       ],
//                     )
//                         : Container()),
//                     Align(
//                       alignment: Alignment.center,
//                       child: SizedBox(
//                           width: 50.w,
//                           height: 55,
//                           child: Obx(()=>controller.isLoading.value ? Center(child: CircularProgressIndicator(strokeCap: StrokeCap.round, color: Colors.black,),) : SubmitButton(title: controller.buttonMessage.value, onTap: (){
//                             print(controller.verificationCode.value);
//                             !controller.otpSent.value ? controller.sendOtp() : controller.otp.value.length>6 ? null : controller.verifyOtp(controller.otp.value, context);
//                           }, theme: "black"))),
//                     ),
//                   ],
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }
