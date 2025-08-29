import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../Model/report_model.dart';
import '../../../Constants/constant_asset.dart';
import '../../../Controller/report_controller.dart';
import '../../../Controller/submission_controller.dart';

class ProjectCardWeb extends StatelessWidget {
  final ReportModel report;
  final VoidCallback assignConsultant;
  final VoidCallback assignArchitect;
  final ReportController reportController = Get.find<ReportController>();
  final SubmissionController controller = Get.find<SubmissionController>();

  ProjectCardWeb({
    super.key,
    required this.report,
    required this.assignConsultant,
    required this.assignArchitect,
  });

  String getDesignType(ReportModel report) {
    String services = report.commonData?.selectedServices?.join(", ") ?? "";
    if (services.contains("Floor Plan")) {
      return report.floorPlan?.elevationType ?? "NA";
    } else if (services.contains("3D Elevation")) {
      return report.threeDPlan?.elevationType?.join(", ") ?? "NA";
    } else if (services.contains("Interior")) {
      return report.interiorPlan?.interiorDesignType ?? "NA";
    }
    return "NA";
  }

  String getDate(String date) {
    DateTime dateTime = DateTime.parse(date.split("T")[0]);
    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  String getLastDate(String date) {
    DateTime dateTime = DateTime.parse(date.split("T")[0]);
    return DateFormat('dd MMM yyyy').format(dateTime.add(Duration(days: 3)));
  }

  Widget buildDetailTile(String title, String value, String iconPath) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(iconPath, width: 16, height: 16),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            "$title: $value",
            style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  Widget buildCardButton({
    required String title,
    required String icon,
    required VoidCallback onTap,
    bool darkTheme = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        height: 40,
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: darkTheme ? null : Border.all(color: Color(0xFF6A6A6A), width: 0.5),
          color: darkTheme ? Colors.black : Color(0xFFE4E4E4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                color: darkTheme ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            Image.asset(icon, width: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String cardId = report.projectId ?? UniqueKey().toString();
    final status = report.status?.toLowerCase(); // e.g. "new", "pending", "completed"
    final showButtons = status == "pending" || status == "completed";

    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Obx(() {
        final isExpanded = reportController.isCardExpanded(cardId);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                report.commonData?.selectedServices?.join(", ") ?? "NA",
                style: GoogleFonts.outfit(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              subtitle: Text(
                report.commonData?.createdBy ?? "NA",
                style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              trailing: Wrap(
                spacing: 8,
                children: [
                  if (status != "pending" && status != "completed") ...[
                    InkWell(
                      onTap: assignConsultant,
                      child: Text("Assign\nConsultant", style: GoogleFonts.poppins(fontSize: 11), textAlign: TextAlign.center),
                    ),
                    InkWell(
                      onTap: assignArchitect,
                      child: Text("Assign\nArchitect", style: GoogleFonts.poppins(fontSize: 11), textAlign: TextAlign.center),
                    ),
                  ],
                  InkWell(
                    onTap: () => reportController.toggleExpanded(cardId),
                    child: Text(
                      isExpanded ? "Hide Details" : "View Details",
                      style: GoogleFonts.poppins(fontSize: 11),
                    ),
                  ),
                ],
              ),

            ),
            if (isExpanded)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    buildDetailTile("Built Area", "${report.commonData?.totalBuildupArea ?? "NA"} sq.ft.", kaBuiltArea),
                    buildDetailTile("Location", report.commonData?.location ?? "NA", kaLocation),
                    buildDetailTile("Floors", "G + ${(report.commonData?.floorCount ?? 1) - 1}", kaFloors),
                    buildDetailTile("Elevation", getDesignType(report), kaElevation),
                    buildDetailTile("Facing", report.commonData?.homeFrontFacing ?? "NA", kaFacing),
                    if (report.createdDate != null) ...[
                      buildDetailTile("Date", getDate(report.createdDate!), kaDate),
                      buildDetailTile("Last Date", getLastDate(report.createdDate!), kaDate),
                    ],
                    SizedBox(height: 16),
                    /**** Show buttons only for Pending and Completed ****/
                    if (showButtons)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildCardButton(
                            title: "Update Data",
                            icon: kaUpload,
                            onTap: () {
                              controller.fetchSubmissions(report.projectId!, context);
                              Navigator.pushNamed(context, '/submissionMainPage', arguments: report);
                            },
                          ),
                          buildCardButton(
                            title: "Chat Now",
                            icon: kaChatNow,
                            onTap: () {
                              Navigator.pushNamed(context, '/chat', arguments: report);
                            },
                            darkTheme: true,
                          ),
                        ],
                      ),

                    SizedBox(height: 16),
                  ],
                ),
              ),
          ],
        );
      }),
    );
  }
}
