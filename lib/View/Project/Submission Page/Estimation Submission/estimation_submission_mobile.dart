import 'package:flutter/material.dart';
import '../../../../Components/Cards/Submission plan cards/revision_card_mobile.dart';
import '../../../../Components/Cards/Submission plan cards/submission_page_headings_icons_mobile.dart';
import '../../../../Model/report_model.dart';

class EstimationSubmissionMobile extends StatelessWidget {
  EstimationSubmissionMobile({super.key});

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
              "Project - Approximate Estimation",
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
            trailing: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.blue,
              ),
              alignment: Alignment.center,
              child: Text("Update", style: TextStyle(
                  fontSize: 11,
                  color: Colors.white
              ),),
            ),
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
                    SubmissionPageHeadingsIconsMobile(title: 'Estimation',),
                    const SizedBox(height: 12,),
                    RevisionCardMobile(totalRevision: "5", remainingRevision: "3", extraRevision: "0")
                  ],
                ),
                const SizedBox(height: 30.0,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
