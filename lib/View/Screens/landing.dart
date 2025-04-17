import 'package:b_designer_architecture/Helper/responsive.dart';
import 'package:b_designer_architecture/View/Screens/Mobile/landing_mobile.dart';
import 'package:b_designer_architecture/View/Screens/Web/landing_web.dart';
import 'package:flutter/material.dart';

import '../../Helper/size_config.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});



  @override
  Widget build(BuildContext context) {

    initiateSize(context);

    return Responsive(mobile: LandingMobile(), tablet: LandingWeb(), desktop: LandingWeb());
  }

  void initiateSize(BuildContext context){
    WidgetsBinding.instance.addPostFrameCallback((_){
      SizeConfig.init(
        BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
        ),
        MediaQuery.of(context).orientation,
      );
    });
  }
}
