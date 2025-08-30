import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Components/Buttons/update_button.dart';
import '../../../../Components/Cards/Submission plan cards/charge_section_widget.dart';
import 'package:get/get.dart';

import '../../../../Components/Cards/Submission plan cards/revision_card.dart';
import '../../../../Components/Cards/Submission plan cards/submission_page_heading_icons.dart';
import '../../../../Components/Widgets/report_card_file_picker.dart';
import '../../../../Components/Widgets/report_card_image_picker.dart';
import '../../../../Controller/client_controller.dart';
import '../../../../Controller/report_controller.dart';
import '../../../../Controller/submission_controller.dart';
import '../../../../Model/report_model.dart';

class FloorPlanSubmissionWeb extends StatelessWidget {
  FloorPlanSubmissionWeb({super.key});

  final ReportController controller = Get.find<ReportController>();
  final ClientController clientController = Get.find<ClientController>();
  final SubmissionController submissionController = Get.find<SubmissionController>();
  final ScrollController floorPlanScroll = ScrollController();
  final ScrollController threeDScroll = ScrollController();
  final ScrollController elevationScroll = ScrollController();
  final ScrollController documentScroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    final report = ModalRoute.of(context)?.settings.arguments as ReportModel?;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
            onTap: ()=>Navigator.pop(context, report),
            child: Icon(Icons.arrow_back_rounded, size: 40, color: Colors.black,)),
      ),
      body: ListView(
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(20),
            tileColor: Colors.white,
            title: Text(
              "Project - Architectural Floor Plan",
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF656565),
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(report?.createdBy ?? "NA",
                style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF656565),
                    fontWeight: FontWeight.bold)),
            trailing: Obx(()=>submissionController.isLoading.value ?
            CircularProgressIndicator(strokeCap: StrokeCap.round,)
                : UpdateButton(
                onTap: (){
                  submissionController.floorPlanSubmission(context, report?.projectId ?? "", 2);
                })),
          ),
          const SizedBox(height: 10.0,),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SubmissionPageHeadingsIcons(title: '2D Floor Plan',),
                    Spacer(),
                    RevisionCard(totalRevision: "5", remainingRevision: "3", extraRevision: "0")
                  ],
                ),
                /**** 2D Floor Plan ****/
                Text(
                  '2D Floor Plan',
                  style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Container(height: 2, width: 80, color: Colors.black),
                const SizedBox(height: 10),
                ReportCardImagePicker(
                  imageUrls: submissionController.submission.value.twoDFloorPlan ?? [],
                  imageList: submissionController.twoDFloorPlan,
                  onPick: submissionController.pickImage,
                  onAdd: () => submissionController.addImageToList(submissionController.twoDFloorPlan, "two_d_floor_plan"),
                ),
                const SizedBox(height: 30,),
                /**** 3D Floor Plan ****/
                Text(
                  '3D Floor Plan',
                  style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Container(height: 2, width: 80, color: Colors.black),
                const SizedBox(height: 10),
                ReportCardImagePicker(
                  imageUrls: submissionController.submission.value.threeDFloorPlan,
                  imageList: submissionController.threeDFloorPlan,
                  onPick: submissionController.pickImage,
                  onAdd: () => submissionController.addImageToList(submissionController.threeDFloorPlan, "three_d_floor_plan"),
                ),
                const SizedBox(height: 30,),
                /**** Section and Elevation plans ****/
                Text(
                  'Section & Elevation Plans',
                  style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Container(height: 2, width: 80, color: Colors.black),
                const SizedBox(height: 10),
                ReportCardImagePicker(
                  imageUrls: submissionController.submission.value.sectionElevationPlan ?? [],
                  imageList: submissionController.sectionAndElevationPlan,
                  onPick: submissionController.pickImage,
                  onAdd: () => submissionController.addImageToList(submissionController.sectionAndElevationPlan, "section_elevation_plan"),
                ),
                const SizedBox(height: 30,),
                /**** Document Files ****/
                Text(
                  'Document File',
                  style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Container(height: 2, width: 80, color: Colors.black),
                const SizedBox(height: 10),
                ReportCardFilePicker(
                  fileUrls: submissionController.submission.value.document,
                  fileList: submissionController.documentFiles, // your list
                  onPick: submissionController.pickFile,
                  onAdd: () => submissionController.addFileToList(submissionController.documentFiles, "document"), // or any label
                ),
                const SizedBox(height: 30),
                /**** 2d floor extra revisions and discount ****/
                Obx(() {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: clientController.twoDFloorPlanRevisionsChargesDiscounts.length,
                    itemBuilder: (_, index) {
                      final section = clientController.twoDFloorPlanRevisionsChargesDiscounts[index];
                      return ChargeSectionWidget(section: section);
                    },
                  );
                }),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

