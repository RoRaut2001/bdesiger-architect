import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Components/Buttons/update_button.dart';
import '../../../../Components/Cards/Submission plan cards/charge_section_widget.dart';
import '../../../../Components/Cards/Submission plan cards/revision_card.dart';
import '../../../../Components/Cards/Submission plan cards/submission_page_heading_icons.dart';
import '../../../../Components/Widgets/report_card_image_picker.dart';
import '../../../../Controller/client_controller.dart';
import '../../../../Controller/submission_controller.dart';
import '../../../../Model/report_model.dart';

class PlumbingDesignSubmissionWeb extends StatelessWidget {
  PlumbingDesignSubmissionWeb({super.key});

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
            child: Icon(Icons.arrow_back_rounded, size: 40, color: Colors.black,)),
      ),
      body: ListView(
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(20),
            tileColor: Colors.white,
            title: Text(
              "Project - Plumbing Design",
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
            trailing: Obx(()=>controller.isLoading.value ?
            CircularProgressIndicator(strokeCap: StrokeCap.round,)
                : UpdateButton(
                onTap: (){
                  controller.plumbingPlanSubmission(context, report.projectId ?? "", 2);
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
                    SubmissionPageHeadingsIcons(title: 'Plumbing Design',),
                    const Spacer(),
                    RevisionCard(totalRevision: "5", remainingRevision: "3", extraRevision: "0")
                  ],
                ),
                /**** Plumbing Drawings ****/
                const SizedBox(height: 30,),
                Text('Plumbing Design', style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),),
                Container(height: 2, width: 80, color: Colors.black),
                const SizedBox(height: 10),
                ReportCardImagePicker(
                  imageUrls: controller.submission.value.plumbingDesign,
                  imageList: controller.plumbingDesign,
                  onPick: controller.pickImage,
                  onAdd: () => controller.addImageToList(controller.plumbingDesign, "plumbing_design"),
                ),
                const SizedBox(height: 30,),
                Obx(() {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: clientController.plumbingPlanRevisionsChargesDiscounts.length,
                    itemBuilder: (_, index) {
                      final section = clientController.plumbingPlanRevisionsChargesDiscounts[index];
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
