import 'package:b_designer_architecture/Components/Buttons/primary_button.dart';
import 'package:b_designer_architecture/Constants/constant_color.dart';
import 'package:b_designer_architecture/Controller/auth_controller.dart';
import 'package:b_designer_architecture/Controller/screen_controller.dart';
import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popover/popover.dart';
import 'package:super_bullet_list/bullet_list.dart';

import '../../../Components/top_bar.dart';

class LandingWeb extends StatelessWidget {
   LandingWeb({super.key});

   final ScreenController controller = Get.find<ScreenController>();
   final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: screenSize.width > 750 ? TopBar(selectedIndex: 0, onSelect: (index){
        controller.selectedScreen.value = index;
      }, onContact: ()=>authController.launchWhatsApp(),) : null,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 70.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dream Spaces & Design\nSolutions",
                      style: TextStyle(
                          fontSize: 3.t,
                          color: kcNavyBlue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Connecting architects to endless opportunities, where creativity thrives.\nCollaborate seamlessly with clients and showcase your expertise.\nJoin a platform designed to empower your vision and deliver excellence.",
                      style: TextStyle(
                          fontSize: 0.8.t,
                          color: kcNavyBlue,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    PrimaryButton(title: "Get Deals", onTap: () {
                      controller.selectedScreen.value = 1;
                    })
                  ],
                ),
                Container(
                  height: 40.h,
                  width: 70.w,
                  child: SizedBox(
                    height: 40.h,
                    width: 70.w,
                    child: Obx(()=>phoneNumberScreen(context)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w
            ),
            width: SizeConfig.screenWidth,
            height: 50.h,
            color: kcFaintBackground,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 25.h,
                  width: 50.w,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          left: 0,
                          child: SvgPicture.network(
                              "https://res.cloudinary.com/dculivch8/image/upload/v1736323223/dots_mwpyha.svg", fit: BoxFit.scaleDown, height: 15.h, width: 20.w,)),
                      Positioned(
                          top: 0,
                          right: 0,
                          child: SizedBox(
                            height: 25.h,
                            width: 50.w,
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.h),
                                  bottomLeft: Radius.circular(15.h),
                                  bottomRight: Radius.circular(15.h),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: "https://res.cloudinary.com/dculivch8/image/upload/v1736323225/homeArchitect2_tsjqvh.jpg",
                                  fit: BoxFit.cover,
                                )),
                          ))
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "We offer the best services",
                      style: TextStyle(
                          fontSize: 2.t,
                          color: kcNavyBlue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Transform ideas into reality with our trusted platform.\nDesigned to support your journey from concept to completion.",
                      style: TextStyle(
                          fontSize: 0.8.t,
                          color: kcNavyBlue,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      width: 50.w,
                      child: ListTile(
                        isThreeLine: false,
                        contentPadding: EdgeInsets.all(0),
                        horizontalTitleGap: 5,
                        leading: SvgPicture.network("https://res.cloudinary.com/dculivch8/image/upload/v1736324481/check_uupkvp.svg", fit: BoxFit.scaleDown, height: 20, width: 20,),
                        title: Text("Seamless Collaboration", style: TextStyle(
                          fontSize: 0.8.t,
                          color: kcNavyBlue,
                          fontWeight: FontWeight.w300
                        ),),
                      ),
                    ),
                    SizedBox(
                      width: 50.w,
                      child: ListTile(
                        isThreeLine: false,
                        contentPadding: EdgeInsets.all(0),
                        horizontalTitleGap: 5,
                        leading: SvgPicture.network("https://res.cloudinary.com/dculivch8/image/upload/v1736324481/check_uupkvp.svg", fit: BoxFit.scaleDown, height: 20, width: 20,),
                        title: Text("Dedicated Support", style: TextStyle(
                          fontSize: 0.8.t,
                          color: kcNavyBlue,
                          fontWeight: FontWeight.w300
                        ),),
                      ),
                    ),
                    SizedBox(
                      width: 50.w,
                      child: ListTile(
                        isThreeLine: false,
                        contentPadding: EdgeInsets.all(0),
                        horizontalTitleGap: 5,
                        leading: SvgPicture.network("https://res.cloudinary.com/dculivch8/image/upload/v1736324481/check_uupkvp.svg", fit: BoxFit.scaleDown, height: 20, width: 20,),
                        title: Text("Trusted Platform", style: TextStyle(
                          fontSize: 0.8.t,
                          color: kcNavyBlue,
                          fontWeight: FontWeight.w300
                        ),),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    PrimaryButton(title: "Get Deals", onTap: () {
                      controller.selectedScreen.value = 1;
                    }, isHollow: true,)
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text("The Ultimate Platform for\nYour Design Needs", textAlign: TextAlign.center, style: TextStyle(
            fontSize: 2.t,
            color: kcNavyBlue,
            fontWeight: FontWeight.bold
          ),),
          Text("Discover a space where your architectural expertise meets boundless opportunities.\nOur platform is designed to help you turn client visions into reality with ease and\nefficiency.Collaborate seamlessly, showcase your creativity, and experience a\nprocess that inspires excellence every step of the way.", textAlign: TextAlign.center,
          style: TextStyle(
            color: kcNavyBlue,
            fontSize: 0.8.t,
            fontWeight: FontWeight.w300
          ),
          ),
          SizedBox(
            height: 3.h
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(cardData.length, (index){
                final card = cardData[index];
                return Container(
                  padding: EdgeInsets.all(40.0),
                  height: 25.h,
                  width: 45.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        color: kcNavyBlue.withOpacity(0.08),
                        blurRadius: 12,
                      )
                    ]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 5.h,
                        width: 5.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          color: kcOrange.withOpacity(0.1),
                        ),
                        alignment: Alignment.center,
                        child: SvgPicture.network("https://res.cloudinary.com/dculivch8/image/upload/v1736330061/bluePrint_c0ecd3.svg", fit: BoxFit.scaleDown, height: 2.h, width: 2.h,),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(card['title']!, style: TextStyle(
                        fontSize: 1.2.t,
                        fontWeight: FontWeight.bold,
                        color: kcNavyBlue
                      ),),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(card['data']!, style: TextStyle(
                        fontSize: 0.8.t,
                        fontWeight: FontWeight.w300,
                        color: kcNavyBlue
                      ),),
                      Spacer(),
                      PrimaryButton(title: "Learn More", onTap: (){
                        showLearnMore(context, card['points']!, card["title"]!, card["subtitle"]!);
                      })
                    ],
                  ),
                );
              }),
            ),
          ),
          Container(
            width: SizeConfig.screenWidth,
            height: 40.h,
            color: kcFaintBackground,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("What our customers say\nabout us", textAlign: TextAlign.center, style: TextStyle(
                          fontSize: 2.t,
                          color: kcNavyBlue,
                          fontWeight: FontWeight.bold
                      ),),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(customerReviews.length, (index){
                          final review = customerReviews[index];
                          return Container(
                            padding: EdgeInsets.all(30.0),
                            height: 15.h,
                            width: 45.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 10),
                                      blurRadius: 20,
                                      color: kcNavyBlue.withOpacity(0.08)
                                  )
                                ]
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start  ,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: CachedNetworkImageProvider(review['profilePic']),
                                    radius: 4.w,
                                  ),
                                  contentPadding: EdgeInsets.all(0.0),
                                  title: Text(review['name'], style: TextStyle(
                                      fontSize: 0.9.t,
                                      color: kcNavyBlue,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  subtitle: Text(review['country'], style: TextStyle(
                                      fontSize: 0.9.t,
                                      color: kcNavyBlue,
                                      fontWeight: FontWeight.w300
                                  ),),
                                  trailing: Text('“', style: GoogleFonts.mulish(
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold,
                                      color: kcOrange
                                  ),),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(review['review'], overflow: TextOverflow.ellipsis, maxLines: 3, style: TextStyle(
                                    fontSize: 0.9.t,
                                    color: kcNavyBlue,
                                    fontWeight: FontWeight.w300
                                ),),
                              ],
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    child: SvgPicture.network("https://res.cloudinary.com/dculivch8/image/upload/v1736323223/dots_mwpyha.svg", fit: BoxFit.scaleDown, height:10.h, width: 3.w,)),
                Positioned(
                    top: 0,
                    right: 0,
                    child: SvgPicture.network("https://res.cloudinary.com/dculivch8/image/upload/v1736323223/dots_mwpyha.svg", fit: BoxFit.scaleDown, height:10.h, width: 3.w,)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final List<Map<String, dynamic>> cardData = [
    {
      "title": "Architect Collaboration",
      "subtitle": "Unlock Seamless Design Innovation!",
      "data": "Architects connect with clients to deliver stunning designs. Manage revisions, communicate efficiently, and showcase expertise.",
      "points": [
        "Effortlessly connect with clients and bring visionary designs to life.",
        "Streamline revisions with AI-powered suggestions and real-time collaboration tools.",
        "Showcase your expertise through interactive 3D models and immersive presentations.",
        "Communicate efficiently with built-in chat, video calls, and feedback tracking.",
        "Get recognized for your unique architectural style with a personalized portfolio feature."
      ]
    },
    {
      "title": "Consultant Oversight",
      "subtitle": "Achieve Flawless Project Execution!",
      "data": "Ensure timely project completion with our trusted consultants. A dedicated process to maintain quality and client satisfaction.",
      "points": [
        "Work with top-tier consultants to ensure project perfection from start to finish.",
        "Gain real-time project insights, predictive analytics, and smart risk assessment tools.",
        "Automate quality checks and compliance verification to maintain top-notch standards.",
        "Optimize collaboration with AI-powered task management and automated reports.",
        "Ensure 100% client satisfaction with transparent progress tracking and milestone approvals."
      ]
    },
    {
      "title": "Fair and Transparent Pricing",
      "subtitle": "Maximize Your Earnings with Precision Pricing!",
      "data": "We ensure that prices are always up-to-date, reflecting the value of your work. Our platform is committed to providing architects with accurate pricing, ensuring you are rewarded fairly for your expertise and effort.",
      "points": [
        "Stay ahead with dynamic pricing algorithms that reflect your expertise and demand.",
        "Get paid fairly with AI-driven market analysis and instant quote generation.",
        "Ensure your value is recognized with comprehensive cost breakdowns for clients.",
        "Avoid payment disputes with smart contract integration and secure transactions.",
        "Gain an edge with pricing benchmarks and industry trends at your fingertips."
      ]
    },
  ];

  List<Map<String, dynamic>> customerReviews = [
    {
      'name': 'Alice Johnson',
      'review': 'B Designer provided exceptional service! The team understood my vision and executed it perfectly. Highly recommended for anyone looking to transform their space.',
      'profilePic': 'https://mighty.tools/mockmind-api/content/human/125.jpg',
      'country': 'United States'
    },
    {
      'name': 'James Carter',
      'review': 'The design quality was top-notch, and their attention to detail exceeded my expectations. I’m thrilled with the results and will definitely use their services again.',
      'profilePic': 'https://mighty.tools/mockmind-api/content/human/104.jpg',
      'country': 'Canada'
    },
    {
      'name': 'Sophia Williams',
      'review': 'I had an amazing experience with B Designer! The team was professional and worked closely with me throughout the process. My new home design looks fantastic!',
      'profilePic': 'https://mighty.tools/mockmind-api/content/human/128.jpg',
      'country': 'United Kingdom'
    }
  ];

  void showLearnMore(BuildContext context, List<String> points, String title, String subtitle){
    showDialog(
        context: context, builder: (context){
      return AlertDialog(
        backgroundColor: Colors.white,
        scrollable: true,
        title: ListTile(
          leading: Icon(Icons.architecture, color: kcBrown, size: 50,),
          title: Text(title, style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20
          ),),
          subtitle: Text(subtitle, style: TextStyle(
            color: Colors.black,
            fontSize: 16
          ),),
        ),
        content: SuperBulletList(items: List.generate(points.length, (index){
          return Text(points[index]);
        })),
      );
    });
  }

   RxMap<dynamic, dynamic> selectedCountry = {
     "code": "+91",
     "name": "India",
     "flag": "https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png" // Replace
   }.obs;
   RxList<Map<String, dynamic>> countries = [
     {
       "code": "+91",
       "name": "India",
       "flag": "https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png" // Replace
     },
     {
       "code": "+1",
       "name": "United States",
       "flag": "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/Flag_of_the_United_States_%28Pantone%29.svg/1200px-Flag_of_the_United_States_%28Pantone%29.svg.png" // Replace
     },
     {
       "code": "+44",
       "name": "United Kingdom",
       "flag": "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Flag_of_the_United_Kingdom_%281-2%29.svg/1200px-Flag_of_the_United_Kingdom_%281-2%29.svg.png" // Replace
     },
     {
       "code": "+61",
       "name": "Australia",
       "flag": "https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Flag_of_Australia_%28converted%29.svg/1200px-Flag_of_Australia_%28converted%29.svg.png" // Replace
     },
     {
       "code": "+81",
       "name": "Japan",
       "flag": "https://upload.wikimedia.org/wikipedia/en/thumb/9/9e/Flag_of_Japan.svg/1200px-Flag_of_Japan.svg.png" // Replace
     },
     {
       "code": "+86",
       "name": "China",
       "flag": "https://media.istockphoto.com/id/1041713402/vector/china-national-flag-official-colors-correct-proportion-vector.jpg?s=612x612&w=0&k=20&c=GICmjD_vpP3eV5il_B01eYhaY4lznIIUXIa9SKpdq_E=" // Replace
     },
     {
       "code": "+49",
       "name": "Germany",
       "flag": "https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Flag_of_Germany.svg/800px-Flag_of_Germany.svg.png" // Replace
     },
     {
       "code": "+33",
       "name": "France",
       "flag": "https://cdn.britannica.com/82/682-004-F0B47FCB/Flag-France.jpg" // Replace
     },
     {
       "code": "+39",
       "name": "Italy",
       "flag": "https://upload.wikimedia.org/wikipedia/en/thumb/0/03/Flag_of_Italy.svg/220px-Flag_of_Italy.svg.png" // Replace
     },
     {
       "code": "+7",
       "name": "Russia",
       "flag": "https://upload.wikimedia.org/wikipedia/en/thumb/f/f3/Flag_of_Russia.svg/1200px-Flag_of_Russia.svg.png" // Replace
     },
     {
       "code": "+55",
       "name": "Brazil",
       "flag": "https://upload.wikimedia.org/wikipedia/en/thumb/0/05/Flag_of_Brazil.svg/640px-Flag_of_Brazil.svg.png" // Replace
     },
   ].obs;

   Widget textField(TextEditingController controller, Widget prefixIcon, [List<TextInputFormatter>? formatters, int? maxLength]){
     return TextFormField(
       style: GoogleFonts.inter(
           fontSize: 18
       ),
       inputFormatters: formatters,
       maxLengthEnforcement: (maxLength == null) ? null : MaxLengthEnforcement.enforced,
       maxLength: maxLength,
       controller: controller,
       decoration: InputDecoration(
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
   Widget title(String title){
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
   Widget phoneNumberScreen(BuildContext context){
     return Container(
       padding: EdgeInsets.all(25.0),
       height: 430,
       width: 475,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(25.0),
         color: Colors.white,
         border: Border.all(
           color: Colors.black
         )
       ),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Center(child: logoImage()),
           SizedBox(
             height: 40,
           ),
           title("Enter your phone number"),
           subtitle("Need Help?", "Click Here", (){}),
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
                 textField(authController.phoneController, Builder(
                     builder: (context) {
                       return InkWell(
                         onTap: (){
                           showCountryPopup(context);
                         },
                         child: Container(
                           width: 60,
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               SizedBox(
                                 width: 30,
                                 height: 30,
                                 child: Obx(()=>Image.network(selectedCountry.value['flag'])),
                               ),
                               Icon(Icons.keyboard_arrow_down)
                             ],
                           ),
                         ),
                       );
                     }
                 ), [
                   FilteringTextInputFormatter.digitsOnly
                 ], 10),
                 SizedBox(height: 20,),
                 Obx(()=> authController.isLoading.value ? Center(child: CircularProgressIndicator(color: Colors.orange, strokeCap: StrokeCap.round,),) : submitButton("Send OTP", (){
                   if(authController.phoneController.text.length < 10){
                     Get.snackbar("Oops!", "Please enter valid phone number");
                   }else{
                   }
                 })),
               ],
             ),
           )
         ],
       ),
     );
   }
   void showCountryPopup(BuildContext context){
     showPopover(
         arrowWidth: 0,
         arrowHeight: 0,
         barrierColor: Colors.transparent,
         context: context,
         bodyBuilder: (context){
           return Container(
             height: 300,
             width: 200,
             color: Colors.white,
             child: ListView.builder(
                 itemCount: countries.length,
                 itemBuilder: (context, index){
                   final country = countries[index];
                   return SizedBox(
                     width: 200,
                     child: ListTile(
                       onTap: (){
                         Navigator.pop(context);
                         authController.selectedCode.value = country['code'];
                         selectedCountry.value = country;
                       },
                       title: Text(country['name']),
                       leading: Image.network(country['flag'], height: 30, width: 30,),
                     ),
                   );
                 }),
           );
         });
   }

}
