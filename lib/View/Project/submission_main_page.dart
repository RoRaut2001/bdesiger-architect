import 'package:b_designer_architecture/Constants/constant_asset.dart';
import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:b_designer_architecture/Model/report_model.dart';
import 'package:b_designer_architecture/View/Project/electrical_design_submission.dart';
import 'package:b_designer_architecture/View/Project/estimation_submission.dart';
import 'package:b_designer_architecture/View/Project/floor_plan_submission.dart';
import 'package:b_designer_architecture/View/Project/interior_submission.dart';
import 'package:b_designer_architecture/View/Project/plumbing_design_submission.dart';
import 'package:b_designer_architecture/View/Project/structure_design_submission.dart';
import 'package:b_designer_architecture/View/Project/three_d_plan_submission.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubmissionMainPage extends StatelessWidget {
  final ReportModel report;
  const SubmissionMainPage({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
            onTap: ()=>Get.back(),
            child: Icon(Icons.arrow_back_rounded, size: 40, color: Colors.black,)),
      ),
      body: ListView(
          children: [
            SizedBox(
              height: 2.h,
            ),
            ListTile(
              tileColor: Colors.white,
              title: Text(
                "Project - ${report.commonData!.selectedServices!.join(", ")}",
                style: TextStyle(
                    fontSize: 1.3.t,
                    color: Color(0xFF656565),
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(report.createdBy ?? "NA",
                style: TextStyle(
                    fontSize: 0.9.t,
                    color: Color(0xFF656565),
                    fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 3.h,
            ),
            GridView(
              padding: EdgeInsets.all(20.0),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 3 / 1,
                  crossAxisSpacing: 30.0,
                  mainAxisSpacing: 30.0
              ),
                  children: [
                    if(report.commonData!.selectedServices!.contains("Floor Plan"))_buildSubmissionCard(title: "2D Floor Plan", onTap: () {Get.to(()=>FloorPlanSubmission(report: report), transition: Transition.fade);}, icon: kaFloorPlan),
                    if(report.commonData!.selectedServices!.contains("3D Elevation"))_buildSubmissionCard(title: "3D Elevation", onTap: ()=>Get.to(()=>ThreeDPlanSubmission(report: report), transition: Transition.fade), icon: kaThreeD),
                    if(report.commonData!.selectedServices!.contains("Interior"))_buildSubmissionCard(title: "Interior Design", onTap: ()=>Get.to(()=>InteriorSubmission(report: report), transition: Transition.fade), icon: kaInterior),
                    if(report.commonData!.selectedServices!.contains("Structure"))_buildSubmissionCard(title: "Structure Design", onTap: ()=>Get.to(()=>StructureDesignSubmission(report: report), transition: Transition.fade), icon: kaStructure),
                    if(report.commonData!.selectedServices!.contains("Electrical"))_buildSubmissionCard(title: "Electric Design", onTap: ()=>Get.to(()=>ElectricalDrawingSubmission(report: report), transition: Transition.fade), icon: kaElectrical),
                    if(report.commonData!.selectedServices!.contains("Plumbing"))_buildSubmissionCard(title: "Plumbing Design", onTap: ()=>Get.to(()=>PlumbingDesignSubmission(report: report), transition: Transition.fade), icon: kaPlumbing),
                    if(report.commonData!.selectedServices!.contains("Plumbing"))_buildSubmissionCard(title: "Estimation", onTap: ()=>Get.to(()=>EstimationSubmission(report: report), transition: Transition.fade), icon: kaFloorPlan),
                ],
            ),
          ]
      ),
    );
  }

  Widget _buildSubmissionCard(
      {required String title,
      required VoidCallback onTap,
      required String icon}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: Colors.black, width: 0.5),
            color: Colors.white),
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 1.2.t,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            "Update the data",
            style: TextStyle(fontSize: 0.9.t, color: Color(0xFF7B7B7B)),
          ),
          leading: Image.network(icon),
          trailing: Icon(
            Icons.arrow_forward,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
    );
  }
}
