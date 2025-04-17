import 'package:b_designer_architecture/Constants/constant_asset.dart';
import 'package:b_designer_architecture/Controller/report_controller.dart';
import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:b_designer_architecture/Model/report_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

enum ThemeType{ Dark, Light }

class ProjectCard extends StatelessWidget {
  final ReportModel report;
  final VoidCallback onGetDeal, onForwardDeal;

  ProjectCard({super.key, required this.report, required this.onGetDeal, required this.onForwardDeal});

  final ReportController controller = Get.find<ReportController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFF8D8D8D)),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 1.h,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              alignment: Alignment.centerLeft,
              width: 30.w,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFFDCDCDC)),
              child: Text(
                report.commonData?.selectedServices?.join(", ") ?? "",
                style: GoogleFonts.outfit(
                    fontSize: 1.2.t,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 130 / 20,
                crossAxisSpacing: 30,
                mainAxisSpacing: 5),
            children: [
              _buildCardTile(title: "Name", value: report.commonData?.createdBy ?? "NA", isName: true, valueOnly: true, icon: kaName),
              _buildCardTile(title: "Built Area", value: "${report.commonData?.totalBuildupArea.toString()} sq.ft.", icon: kaBuiltArea),
              _buildCardTile(title: "Location", value: report.commonData?.location ?? "NA", valueOnly: true, icon: kaLocation),
              _buildCardTile(title: "Floors", value: "G + ${(report.commonData!.floorCount! - 1).toString()}", icon: kaFloors),
              _buildCardTile(title: "Elevation", value: getDesignType(report), valueOnly: true, icon: kaElevation),
              _buildCardTile(title: "Facing", value: report.commonData?.homeFrontFacing ?? "NA", valueOnly: true, icon: kaFacing),
              if(report.createdDate != null)_buildCardTile(title: "Date", value: getDate(report.createdDate?.split("T")[0] ?? "NA"), icon: kaDate),
              if(report.createdDate != null)_buildCardTile(title: "Last Date", value: getLastDate(report.createdDate?.split("T")[0] ?? "NA"), icon: kaDate),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildCardButton(title: "Forward To Next", icon: kaForward, onTap: onForwardDeal),
                _buildCardButton(title: "Get This Deal", icon: kaHandshake, onTap: onGetDeal, type: ThemeType.Dark),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardTile({required String title, required String value, required String icon, bool isName = false, bool valueOnly = false}) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      decoration: (isName) ? BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0)),
          color: Color(0xFFDCDCDC)) : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(icon),
          SizedBox(
            width: 1.w,
          ),
          !valueOnly
              ? Flexible(
                child: Text(
                            "${title} - ${value}",
                            style: GoogleFonts.outfit(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
                          ),
              )
              : Flexible(
                child: Text(
                            value,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.outfit(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
                          ),
              )
        ],
      ),
    );
  }
  Widget _buildCardButton({required String title, required String icon, required VoidCallback onTap, ThemeType type = ThemeType.Light}){
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0
        ),
        height: 40,
        width: 22.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: type == ThemeType.Light ? Border.all(
            color: Color(0xFF6A6A6A),
            width: 0.5
          ) : null,
          color: type == ThemeType.Light ? Color(0xFFE4E4E4) : Colors.black
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title, style: GoogleFonts.inter(
              color: type == ThemeType.Light ? Colors.black : Colors.white,
              fontWeight: FontWeight.w600
            ),),
            Image.asset(icon, width: 20,)
          ],
        ),
      ),
    );
  }
  String getDesignType(ReportModel report) {
    String services = report.commonData!.selectedServices!.join(", ");
    if (services.contains("Floor Plan")) {
      return report.floorPlan!.elevationType!;
    } else if (services.contains("3D Elevation")) {
      return report.threeDPlan!.elevationType!.join(", ");
    } else if (services.contains("Interior")) {
      return report.interiorPlan!.interiorDesignType!;
    } else {
      return "NA";
    }
  }
  String getDate(String date){
    DateTime dateTime = DateTime.parse(date.split("T")[0]);
    final formatedDate = DateFormat('dd MMM yyyy').format(dateTime);
    return formatedDate;
  }
  String getLastDate(String date){
    DateTime dateTime = DateTime.parse(date.split("T")[0]);
    final formatedDate = DateFormat('dd MMM yyyy').format(dateTime.add(Duration(days: 3)));
    return formatedDate;
  }
}




class CardButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isHollow;
  CardButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.isHollow = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        alignment: Alignment.center,
        height: 35,
        width: 12.w,
        decoration: BoxDecoration(
            color: isHollow ? Colors.transparent : Colors.black,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
                color: isHollow ? Colors.black : Colors.transparent)),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 0.9.t, color: isHollow ? Colors.black : Colors.white),
        ),
      ),
    );
  }
}
