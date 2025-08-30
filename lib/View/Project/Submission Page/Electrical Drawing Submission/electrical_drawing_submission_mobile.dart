import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Components/Buttons/update_button.dart';
import '../../../../Components/Cards/Submission plan cards/charge_section_widget_mobile.dart';
import '../../../../Components/Cards/Submission plan cards/revision_card_mobile.dart';
import '../../../../Components/Cards/Submission plan cards/submission_page_headings_icons_mobile.dart';
import '../../../../Components/Widgets/report_card_image_picker_mobile.dart';
import '../../../../Controller/client_controller.dart';
import '../../../../Controller/submission_controller.dart';
import '../../../../Model/report_model.dart';

class ElectricalDrawingSubmissionMobile extends StatelessWidget {
  ElectricalDrawingSubmissionMobile({super.key});

  final SubmissionController controller = Get.find<SubmissionController>();
  final ClientController clientController = Get.find<ClientController>();

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
              "Project - Electrical Drawings",
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
                  controller.electricalPlanSubmission(context, report.projectId ?? "", 2);
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
                    SubmissionPageHeadingsIconsMobile(title: 'Electrical Design',),
                    const SizedBox(height: 12,),
                    RevisionCardMobile(totalRevision: "5", remainingRevision: "3", extraRevision: "0")
                  ],
                ),
                const SizedBox(height: 10,),
                /**** Electrical Drawings ****/
                Text('Electrical Drawings', style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500),),
                Container(height: 2, width: 80, color: Colors.black),
                ReportCardImagePickerMobile(
                  imageUrls: controller.submission.value.electricalDrawings,
                  imageList: controller.electricalDesign,
                  onPick: controller.pickImage,
                  onAdd: () => controller.addImageToList(controller.electricalDesign, "electrical_drawings"),
                ),
                const SizedBox(height: 15),
                Obx(() {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: clientController.electricalPlanRevisionsChargesDiscounts.length,
                    itemBuilder: (_, index) {
                      final section = clientController.electricalPlanRevisionsChargesDiscounts[index];
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
