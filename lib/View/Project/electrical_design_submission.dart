import 'package:b_designer_architecture/Components/Cards/revision_card.dart';
import 'package:b_designer_architecture/Components/Cards/submission_item.dart';
import 'package:b_designer_architecture/Constants/constant_asset.dart';
import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:b_designer_architecture/Model/report_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ElectricalDrawingSubmission extends StatelessWidget {
  final ReportModel report;
  ElectricalDrawingSubmission({super.key, required this.report});

  final ScrollController floorPlanScroll = ScrollController();
  final ScrollController threeDScroll = ScrollController();
  final ScrollController elevationScroll = ScrollController();
  final ScrollController documentScroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
            onTap: ()=>Get.back(),
            child: Icon(Icons.arrow_back_rounded, size: 40, color: Colors.black,)),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 5.h,
          ),
          ListTile(
            tileColor: Colors.white,
            title: Text(
              "Project - Electrical Drawings",
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
            trailing: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.blue,
              ),
              alignment: Alignment.center,
              child: Text("Update", style: TextStyle(
                  fontSize: 0.9.t,
                  color: Colors.white
              ),),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: Colors.black,
                              width: 0.5
                          )
                      ),
                      padding: EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: Image.network(kaFloorPlan, fit: BoxFit.scaleDown, width: 25,),
                        title: Text("Structure Design", style: TextStyle(
                            fontSize: 0.9.t,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Tooltip(
                        textAlign: TextAlign.left,
                        preferBelow: false,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                            ),
                            border: Border.all(
                                color: Color(0xFFAEAEAE)
                            ),
                            color: Colors.white
                        ),
                        textStyle: TextStyle(
                            color: Colors.black
                        ),
                        message: "* Upload documents below 5MB size.\n*3D Model Size Below 15MB size.",
                        child: Icon(Icons.error_outline_rounded, size: 40,)),
                    Spacer(),
                    RevisionCard(totalRevision: "5", remainingRevision: "3", extraRevision: "0")
                  ],
                ),
                /**** Electrical Drawings ****/
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.only(
                            bottom: 5.0
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.black,
                                    width: 3
                                )
                            )
                        ),
                        child: Text("Electrical Drawings", style: TextStyle(
                          fontSize: 1.t,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),)),
                    SizedBox(
                      width: 20.0,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(10.0),
                      onTap: (){},
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                        child: Icon(Icons.add, size: 25,),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 65,
                  width: MediaQuery.of(context).size.width - 40,
                  child: Scrollbar(
                    radius: Radius.circular(5),
                    thickness: 5,
                    controller: floorPlanScroll,
                    scrollbarOrientation: ScrollbarOrientation.bottom,
                    child: ListView.builder(
                        controller: floorPlanScroll,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                            child: SubmissionItem(submissionName: "Ground Floor Plan", onPreview: (){}, onDelete: (){}, onEdit: (){}),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                /**** Document Files ****/
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.only(
                            bottom: 5.0
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.black,
                                    width: 3
                                )
                            )
                        ),
                        child: Text("Document Files", style: TextStyle(
                          fontSize: 1.t,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),)),
                    SizedBox(
                      width: 20.0,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(10.0),
                      onTap: (){},
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                        child: Icon(Icons.add, size: 25,),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 65,
                  width: MediaQuery.of(context).size.width - 40,
                  child: Scrollbar(
                    radius: Radius.circular(5),
                    thickness: 5,
                    controller: documentScroll,
                    scrollbarOrientation: ScrollbarOrientation.bottom,
                    child: ListView.builder(
                        controller: documentScroll,
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                            child: SubmissionItem(submissionName: "CAD Doc ${index + 1}", onPreview: (){}, onDelete: (){}, onEdit: (){}),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
