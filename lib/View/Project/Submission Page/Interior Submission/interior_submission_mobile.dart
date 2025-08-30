import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Components/Buttons/update_button.dart';
import '../../../../Components/Cards/Submission plan cards/charge_section_widget_mobile.dart';
import '../../../../Components/Cards/Submission plan cards/exterior_paints_cards.dart';
import '../../../../Components/Cards/Submission plan cards/revision_card_mobile.dart';
import '../../../../Components/Cards/Submission plan cards/submission_page_headings_icons_mobile.dart';
import '../../../../Components/Widgets/report_card_file_picker_mobile.dart';
import '../../../../Components/Widgets/report_card_image_picker_mobile.dart';
import '../../../../Controller/client_controller.dart';
import '../../../../Controller/exterior_paint_controller.dart';
import '../../../../Controller/submission_controller.dart';
import '../../../../Model/report_model.dart';

class InteriorSubmissionMobile extends StatelessWidget {
  InteriorSubmissionMobile({super.key});

  final SubmissionController controller = Get.find<SubmissionController>();
  final ClientController clientController = Get.find<ClientController>();
  final exteriorPaintControllerB = Get.put(ExteriorPaintsController(), tag: 'B');

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
            child: Icon(Icons.arrow_back_rounded, size: 20, color: Colors.black,)),
      ),
      body: ListView(
        children: [
          ListTile(
            tileColor: Colors.white,
            title: Text(
              "Project - Interior Design",
              style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF656565),
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(report!.createdBy ?? "NA",
                style: TextStyle(
                    fontSize: 9,
                    color: Color(0xFF656565),
                    fontWeight: FontWeight.bold)),
            trailing: Obx(()=>controller.isLoading.value ?
            CircularProgressIndicator(strokeCap: StrokeCap.round,)
                : UpdateButton(
                onTap: (){
                  controller.interiorPlanSubmission(context, report.projectId ?? "", 2);
                })),
          ),
          const SizedBox(height: 10.0,),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubmissionPageHeadingsIconsMobile(title: 'Interior Design',),
                    const SizedBox(height: 12,),
                    RevisionCardMobile(totalRevision: "5", remainingRevision: "3", extraRevision: "0")
                  ],
                ),
                const SizedBox(height: 10,),
                /**** Interior Image ****/
                Text(
                  'Interior Image',
                  style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500),
                ),
                Container(height: 2, width: 80, color: Colors.black),
                ReportCardImagePickerMobile(
                  imageList: controller.interiorElevationImage,
                  onPick: controller.pickImage,
                  onAdd: () => controller.addImageToList(controller.interiorElevationImage, "interior_elevation_images"),
                ),
                const SizedBox(height: 30,),
                /**** 3D 360 VR Image ****/
                Text(
                  'Interior 360 VR Images',
                  style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500),
                ),
                Container(height: 2, width: 80, color: Colors.black),
                ReportCardImagePickerMobile(
                  imageUrls: controller.submission.value.interiorVr,
                  imageList: controller.interior360VRImages,
                  onPick: controller.pickImage,
                  onAdd: () => controller.addImageToList(controller.interior360VRImages, "interior_vr"),
                ),
                const SizedBox(height: 30,),
                /**** Interior AR 3D Model ****/
                Text(
                  'AR 3D Model',
                  style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500),
                ),
                Container(height: 2, width: 80, color: Colors.black),
                ReportCardFilePickerMobile(
                  fileUrls: controller.submission.value.interiorAr,
                  fileList: controller.interiorAr3DModel,
                  onPick: controller.pickFile,
                  onAdd: () => controller.addFileToList(controller.interiorAr3DModel, "interior_ar"),
                ),
                const SizedBox(height: 30),
                /**** Interior Elevation Dimensions ****/
                Text(
                  'Elevation Dimensions',
                  style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500),
                ),
                Container(height: 2, width: 80, color: Colors.black),
                ReportCardImagePickerMobile(
                  imageUrls: controller.submission.value.elevationDimensions,
                  imageList: controller.interiorElevationDimensions,
                  onPick: controller.pickFile,
                  onAdd: () => controller.addFileToList(controller.interiorElevationDimensions, "elevation_dimensions"),
                ),
                const SizedBox(height: 30),
                /**** Exterior Paints ****/
                ExteriorPaintsCard(controller: exteriorPaintControllerB,),
                /**** Interior Document Files ****/
                Text(
                  'Document Files',
                  style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500),
                ),
                Container(height: 2, width: 80, color: Colors.black),
                ReportCardFilePickerMobile(
                  fileUrls: controller.submission.value.document,
                  fileList: controller.interiorDocumentFiles,
                  onPick: controller.pickFile,
                  onAdd: () => controller.addFileToList(controller.interiorDocumentFiles, "interior_document"),
                ),
                const SizedBox(height: 30),
                /**** Interior elevation extra revisions and discount ****/
                Obx(() {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: clientController.interiorPlanRevisionsChargesDiscounts.length,
                    itemBuilder: (_, index) {
                      final section = clientController.interiorPlanRevisionsChargesDiscounts[index];
                      return ChargeSectionWidgetMobile(section: section);
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
