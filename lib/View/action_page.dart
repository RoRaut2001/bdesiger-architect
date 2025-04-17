// import 'package:b_designer_architecture/Constants/constant_color.dart';
// import 'package:b_designer_architecture/Helper/size_config.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../Constants/constant_asset.dart';
// import '../Constants/constant_utils.dart';
//
// class ActionPage extends StatelessWidget {
//   const ActionPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Container(
//         padding: EdgeInsets.all(3.h),
//         decoration: BoxDecoration(
//             gradient: LinearGradient(colors: [
//           kcGradient1,
//           kcGradient2,
//         ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
//         child: Scaffold(
//           backgroundColor: Colors.transparent,
//           body: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               IconButton(
//                   splashRadius: 0.1,
//                   onPressed: () {
//                     // Get.to(()=>LandingPage());
//                   },
//                   icon: Icon(
//                     Icons.close_rounded,
//                     color: Colors.white,
//                   )),
//               Center(
//                 child: Column(
//                   children: [
//                     Text(
//                       'BDesigner',
//                       style: ktBDesigner.copyWith(
//                           color: Colors.white,
//                           fontSize: 5.t,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       height: 0.5.h,
//                     ),
//                     Text(
//                       textAlign: TextAlign.center,
//                       'Complete Management, Professional Solutions',
//                       style: GoogleFonts.inter(
//                           fontSize: 1.8.t,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w400),
//                     ),
//                     SizedBox(
//                       height: 3.h,
//                     ),
//                     SizedBox(
//                       height: 40.h,
//                       child: Stack(
//                         children: [
//                           Positioned(
//                               top: 18.5.h,
//                               left: 6.w,
//                               child: ClipRRect(
//                                   child: Image(
//                                 width: 15.w,
//                                 image:
//                                     AssetImage(kaActionImg3),
//                                 fit: BoxFit.cover,
//                               ))),
//                           Positioned(
//                               top: 4.5.h,
//                               left: 9.w,
//                               child: ClipRRect(
//                                   child: Image(
//                                 width: 23.w,
//                                 image:
//                                     AssetImage(kaActionImg1),
//                                 fit: BoxFit.cover,
//                               ))),
//                           Positioned(
//                               top: 0,
//                               right: 3.w,
//                               child: ClipRRect(
//                                   child: Image(
//                                 width: 27.w,
//                                 image:
//                                     AssetImage(kaActionImg2),
//                                 fit: BoxFit.cover,
//                               ))),
//                           Positioned(
//                               top: 19.h,
//                               right: 5.5.w,
//                               child: ClipRRect(
//                                   child: Image(
//                                 width: 14.w,
//                                 image:
//                                     AssetImage(kaActionImg5),
//                                 fit: BoxFit.cover,
//                               ))),
//                           Positioned(
//                               top: 11.h,
//                               left: 22.w,
//                               child: ClipRRect(
//                                   child: Image(
//                                 width: 46.5.w,
//                                 image:
//                                     AssetImage(kaActionImg6),
//                                 fit: BoxFit.cover,
//                               )))
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 1.5.h,
//                     ),
//                     Text(
//                       '200+',
//                       style: GoogleFonts.inter(
//                           fontSize: 5.t,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       'Civil Engineers, Architects & House\nOwners completed their Designs through\nBDesigner.',
//                       style: GoogleFonts.inter(
//                           fontSize: 1.8.t,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w400),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(
//                       height: 5.h,
//                     ),
//                     InkWell(
//                       onTap: (){
//                         // Get.to(()=>LandingPage());
//                       },
//                       child: Container(
//                         alignment: Alignment.center,
//                         padding: EdgeInsets.symmetric(vertical: 1.8.h),
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10)),
//                         child: Text(
//                           'Get Free Landing Estimation',
//                           style: GoogleFonts.inter(
//                               fontSize: 2.5.t,
//                               color: Colors.black,
//                               fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 2.h,
//                     ),
//                     Text(
//                       'Takes less than 6 minutes',
//                       style: GoogleFonts.inter(
//                           fontSize: 1.8.t,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w400),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
