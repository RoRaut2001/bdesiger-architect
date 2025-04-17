import 'package:b_designer_architecture/Constants/constant_asset.dart';
import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Connect with us", style: TextStyle(
          fontSize: 1.t,
          color: Colors.black,
        ),),
        SizedBox(
          height: 1.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(kaInstagram),
            SizedBox(width: 2.w),
            SvgPicture.asset(kaYoutube),
            SizedBox(width: 2.w),
            SvgPicture.asset(kaLinkedIn),
            SizedBox(width: 2.w),
          ],
          crossAxisAlignment: CrossAxisAlignment.end,
        ),
        SizedBox(
          height: 1.h,
        ),
        Text("2021-${DateTime.now().year} bdesigner.online - Banashankari Designer Visualisation Pvt. Ltd. All Rights Reserved.", style: TextStyle(
          fontSize: 1.t,
          color: Colors.black,
        ),)
      ],
    );
  }
}
