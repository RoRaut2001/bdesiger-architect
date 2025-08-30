import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Components/Buttons/update_button.dart';
import '../../../../Components/Cards/Submission plan cards/charge_section_widget.dart';
import '../../../../Components/Cards/Submission plan cards/exterior_paints_cards.dart';
import '../../../../Components/Cards/Submission plan cards/revision_card.dart';
import '../../../../Components/Cards/Submission plan cards/submission_page_heading_icons.dart';
import '../../../../Components/Widgets/report_card_file_picker.dart';
import '../../../../Components/Widgets/report_card_image_picker.dart';
import '../../../../Controller/client_controller.dart';
import '../../../../Controller/exterior_paint_controller.dart';
import '../../../../Controller/submission_controller.dart';
import '../../../../Model/report_model.dart';

class ThreeDPlanSubmissionWeb extends StatelessWidget {
  ThreeDPlanSubmissionWeb({super.key});

  final SubmissionController controller = Get.find<SubmissionController>();
  final ClientController clientController = Get.find<ClientController>();
  final exteriorPaintControllerA = Get.put(ExteriorPaintsController(), tag: 'A');


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
            onTap: ()=> Navigator.pop(context, report),
            child: Icon(Icons.arrow_back_rounded, size: 40, color: Colors.black,)),
      ),
      body: ListView(
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(20),
            tileColor: Colors.white,
            title: Text(
              "Project - 3D Elevation Design",
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF656565),
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(report!.createdBy ?? "NA",
                style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF656565),
                    fontWeight: FontWeight.bold)),
            trailing:  Obx(()=>controller.isLoading.value ?
            CircularProgressIndicator(strokeCap: StrokeCap.round,)
                : UpdateButton(
                onTap: (){
                  controller.threeDPlanSubmission(context, report.projectId ?? "", 2);
                })),
          ),
          const SizedBox(height: 10.0,),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SubmissionPageHeadingsIcons(title: '3D Elevation',),
                    Spacer(),
                    RevisionCard(totalRevision: "5", remainingRevision: "3", extraRevision: "0")
                  ],
                ),
                /**** 3d Elevation Image ****/
                Text(
                  '3D Elevation Image',
                  style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Container(height: 2, width: 80, color: Colors.black),
                const SizedBox(height: 10),
                ReportCardImagePicker(
                  imageUrls: controller.submission.value.elevation,
                  imageList: controller.elevation,
                  onPick: controller.pickImage,
                  onAdd: () => controller.addImageToList(controller.elevation, "elevation"),
                ),
                const SizedBox(height: 30,),
                /**** 3D 360 VR Image ****/
                Text(
                  '3D 360 VR Images',
                  style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Container(height: 2, width: 80, color: Colors.black),
                const SizedBox(height: 10),
                ReportCardImagePicker(
                  imageUrls: controller.submission.value.vrModel,
                  imageList: controller.vrModel,
                  onPick: controller.pickImage,
                  onAdd: () => controller.addImageToList(controller.vrModel, "vr_model"),
                ),
                const SizedBox(height: 30,),
                /**** AR 3D Model ****/
                Text(
                  'AR 3D Model',
                  style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Container(height: 2, width: 80, color: Colors.black),
                const SizedBox(height: 10),
                ReportCardFilePicker(
                  fileList: controller.arModel,
                  onPick: controller.pickFile,
                  onAdd: () => controller.addFileToList(controller.arModel, "ar_model"),
                ),
                const SizedBox(height: 30),
                /**** Elevation Dimensions ****/
                Text(
                  'Elevation Dimensions',
                  style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Container(height: 2, width: 80, color: Colors.black),
                const SizedBox(height: 10),
                ReportCardImagePicker(
                  imageUrls: controller.submission.value.elevationImage,
                  imageList: controller.elevationDimensions,
                  onPick: controller.pickFile,
                  onAdd: () => controller.addFileToList(controller.elevationDimensions, "elevation_image"),
                ),
                const SizedBox(height: 30),
                /**** Exterior Paints ****/
                ExteriorPaintsCard(controller: exteriorPaintControllerA,),
                /**** Document Files ****/
                Text(
                  'Document Files',
                  style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Container(height: 2, width: 80, color: Colors.black),
                const SizedBox(height: 10),
                ReportCardFilePicker(
                  fileUrls: controller.submission.value.document,
                  fileList: controller.documentFiles,
                  onPick: controller.pickFile,
                  onAdd: () => controller.addFileToList(controller.documentFiles, "three_d_document", context: context),
                ),
                const SizedBox(height: 30),
                /**** 3d elevation extra revisions and discount ****/
                Obx(() {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: clientController.threeElevationPlanRevisionsChargesDiscounts.length,
                    itemBuilder: (_, index) {
                      final section = clientController.threeElevationPlanRevisionsChargesDiscounts[index];
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
