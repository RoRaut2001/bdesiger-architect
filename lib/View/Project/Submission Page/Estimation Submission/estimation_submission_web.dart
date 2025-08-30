import 'package:flutter/material.dart';
import '../../../../Components/Buttons/update_button.dart';
import '../../../../Components/Cards/Submission plan cards/revision_card.dart';
import '../../../../Components/Cards/Submission plan cards/submission_page_heading_icons.dart';
import '../../../../Model/report_model.dart';

class EstimationSubmissionWeb extends StatelessWidget {
  EstimationSubmissionWeb({super.key});

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
                "Project - Approximate Estimation",
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF656565),
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(report!.createdBy ?? "NA",
                  style: TextStyle(
                      fontSize: 1,
                      color: Color(0xFF656565),
                      fontWeight: FontWeight.bold)),
              trailing: UpdateButton(onTap: (){})
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
                    SubmissionPageHeadingsIcons(title: 'Estimation',),
                    Spacer(),
                    RevisionCard(totalRevision: "5", remainingRevision: "3", extraRevision: "0")
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
