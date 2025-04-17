import 'package:b_designer_architecture/Components/Charts%20and%20Tables/analytic_chart.dart';
import 'package:b_designer_architecture/Components/Charts%20and%20Tables/rating_bar.dart';
import 'package:b_designer_architecture/Constants/constant_asset.dart';
import 'package:b_designer_architecture/Controller/auth_controller.dart';
import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AnalyticsWeb extends StatelessWidget {
  AnalyticsWeb({super.key});

  final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          padding: EdgeInsets.all(10.0),
          width: double.maxFinite,
          margin: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Colors.black,
              width: 0.5
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0xFFFFEAD1),
                  child: Icon(Icons.star_outline_rounded, color: Color(0xFFF98600), size: 35,),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 5
                ),
                title: Obx(()=>Text(controller.averageRating.value.toPrecision(2).toString(), style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFF98600),
                  fontSize: 1.4.t
                ),)),
                subtitle: Text("Rating in last 100 orders", style: GoogleFonts.inter(
                  color: Color(0xFF505050),
                  fontWeight: FontWeight.w500
                ),),
              ),
              Container(
                width: 40.w,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Color(0xFFFFEAD1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Icon(Icons.error_outline_rounded, color: Color(0xFFF98600), size: 25,),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Minimum Rating required is 4.8", style: GoogleFonts.inter(
                      fontSize: 1.t,
                      fontWeight: FontWeight.w600,
                      color:  Color(0xFFF98600),
                    ),),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Obx(()=>RatingBar(rating: controller.averageRating.value.toPrecision(2))),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                  color: Colors.black,
                  width: 0.5
              )
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              _buildRateTile(title: "75%", subtitle: "Response Rate", icon: kaRate, onTap: (){}),
              Divider(color: Color(0xFF868686), height: 0.2,),
              _buildRateTile(title: "85%", subtitle: "Service Delivery Rate", icon: kaRate, onTap: (){}),
              Divider(color: Color(0xFF868686), height: 0.2,),
              _buildRateTile(title: "100%", subtitle: "First Time Right", icon: kaRate, onTap: (){}),
              Divider(color: Color(0xFF868686), height: 0.2,),
              _buildRateTile(title: "47%", subtitle: "Estimate Pass", icon: kaRate, onTap: (){}),
              Divider(color: Color(0xFF868686), height: 0.2,),
              _buildRateTile(title: "0%", subtitle: "Audit Fail", icon: kaRate, onTap: (){}),
            ],
          ),
        ),
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                  color: Colors.black,
                  width: 0.5
              )
          ),
          child: Expanded(child: Obx(()=>ArchitectRatingSplineChart(ratingData: controller.myRatings.value)))
        ),
      ],
    );
  }

  Widget _buildRateTile({required String title, required String subtitle, required String icon, required VoidCallback onTap}){
    return ListTile(
      leading: SizedBox(
        height: 30,
        width: 30,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xFFF2F2F2),
              child: Image.asset(icon),
            ),
            Positioned(
                top: 0,
                right: 0,
                child: Icon(Icons.check_circle_rounded, color: CupertinoColors.activeGreen,size: 10,))
          ],
        ),
      ),
      contentPadding: EdgeInsets.all(0),
      title: Text(title, style: TextStyle(
        fontSize: 1.2.t,
        fontWeight: FontWeight.bold,
        color: Color(0xFF2B2B2B)
      ),),

      subtitle: RichText(text: TextSpan(
        children: [
          TextSpan(
            text: subtitle, style: TextStyle(
              fontSize: 0.8.t,
              fontWeight: FontWeight.bold,
              color: Color(0xFF989898)
          ),
          ),
          TextSpan(
            text: " in last 20 deals", style: TextStyle(
              fontSize: 0.8.t,
              fontWeight: FontWeight.w500,
              color: Color(0xFF989898)
          ),
          )
        ]
      )),
      trailing: Image.asset(kaGo, height: 30),
    );
  }
}



