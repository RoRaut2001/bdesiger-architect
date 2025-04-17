import 'package:b_designer_architecture/Components/Cards/revision_card.dart';
import 'package:b_designer_architecture/Components/Cards/submission_item.dart';
import 'package:b_designer_architecture/Constants/constant_asset.dart';
import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:b_designer_architecture/Model/report_model.dart';
import 'package:b_designer_architecture/View/ar_file_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:b_designer_architecture/Components/Cards/paint_card.dart';

class ThreeDPlanSubmission extends StatelessWidget {
  final ReportModel report;
  ThreeDPlanSubmission({super.key, required this.report});

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
              "Project - 3D Elevation Design",
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
                        title: Text("3D Elevation", style: TextStyle(
                            fontSize: 1.t,
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
                /**** 3d Elevation Image ****/
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
                        child: Text("3D Elevation Image", style: TextStyle(
                          fontSize: 1.t,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),)),
                    SizedBox(
                      width: 20.0,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(10.0),
                      onTap: (){
                        showCreatePopup(context: context, projectId: report.projectId!, title: "3D Elevation Image");
                      },
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
                            child: SubmissionItem(submissionName: "Front Elevation", onPreview: (){
                              Navigator.pop(context);
                              showPreview(context: context, content: "");
                            }, onDelete: (){}, onEdit: (){}),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                /**** 3D 360 VR Image ****/
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
                        child: Text("3D 360 VR Image", style: TextStyle(
                          fontSize: 1.t,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),)),
                    SizedBox(
                      width: 20.0,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(10.0),
                      onTap: (){
                        showCreatePopup(context: context, projectId: report.projectId!, title: "3D 360 VR Image");
                      },
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
                  height: 70,
                  width: MediaQuery.of(context).size.width - 40,
                  child: Scrollbar(
                    radius: Radius.circular(5),
                    thickness: 5,
                    controller: threeDScroll,
                    scrollbarOrientation: ScrollbarOrientation.bottom,
                    child: ListView.builder(
                        controller: threeDScroll,
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                            child: SubmissionItem(submissionName: "Front View", onPreview: (){
                              Navigator.pop(context);
                              showPreview(context: context, content: "");
                            }, onDelete: (){}, onEdit: (){}),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                /**** AR 3D Model ****/
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
                        child: Text("AR 3D Model", style: TextStyle(
                          fontSize: 1.t,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),)),
                    SizedBox(
                      width: 20.0,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(10.0),
                      onTap: (){
                        showCreatePopup(context: context, projectId: report.projectId!, title: "AR 3D Model");
                      },
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
                    controller: elevationScroll,
                    scrollbarOrientation: ScrollbarOrientation.bottom,
                    child: ListView.builder(
                        controller: elevationScroll,
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                            child: SubmissionItem(submissionName: "3D AR Model ${index + 1}", onPreview: (){
                              Navigator.pop(context);
                              Get.to(()=>ArFilePreview(src: "https://res.cloudinary.com/dculivch8/raw/upload/v1744701574/doreamonhouse_z15nft.obj", title: "Doraemon House"));
                            }, onDelete: (){}, onEdit: (){}),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                /**** Elevation Dimensions ****/
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
                        child: Text("Elevation Dimensions", style: TextStyle(
                          fontSize: 1.t,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),)),
                    SizedBox(
                      width: 20.0,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(10.0),
                      onTap: (){
                        showCreatePopup(context: context, projectId: report.projectId!, title: "Elevation Dimensions");
                      },
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
                            child: SubmissionItem(submissionName: "Front Elevation Dimensions ${index + 1}", onPreview: (){
                              Navigator.pop(context);
                              showPreview(context: context, content: "");
                            }, onDelete: (){}, onEdit: (){}),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                /**** Exterior Paints ****/
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
                        child: Text("Exterior Paints", style: TextStyle(
                          fontSize: 1.t,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),)),
                    SizedBox(
                      width: 20.0,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(10.0),
                      onTap: (){
                        showCreateDetailedPopup(context: context, projectId: report.projectId!, title: "Exterior Paints");
                      },
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
                  height: 100,
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
                            child: PaintCard(paintName: "Touch of Spring-n", paintCode: "#3226", paintImage: "https://www.asianpaints.com/content/dam/asian_paints/colours/swatches/7806.png.transform/cc-width-720-height-540/image.png", onPreview: () {
                              showDetailedPreview(context: context, content: "https://www.asianpaints.com/content/dam/asian_paints/colours/swatches/7806.png.transform/cc-width-720-height-540/image.png", title: "Touch of Spring-n", subtitle: "#3226");
                            }, onEdit: () {  }, onDelete: () {  }),
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
                      onTap: (){
                        showCreatePopup(context: context, projectId: report.projectId!, title: "Document Files");
                      },
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
                            child: SubmissionItem(submissionName: "CAD Doc ${index + 1}", onPreview: (){
                              showPreview(context: context, content: "");
                            }, onDelete: (){}, onEdit: (){}),
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


  void showCreatePopup({required BuildContext context, required String projectId, required String title}){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context){
          return AlertDialog(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                    color: Colors.black
                )
            ),
            backgroundColor: Colors.white,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, style: TextStyle(
                    fontSize: 1.t,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),),
                SizedBox(
                  height: 2.h,
                ),
                _buildField(hintText: "Enter File Name", controller: TextEditingController()),
                SizedBox(
                  height: 1.h,
                ),
                _buildFilePicker(fileName: "Pick a File", onTap: (){}),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  width: 500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildButton(title: "Cancel", onTap: ()=>Navigator.pop(context)),
                      SizedBox(
                        width: 3.w,
                      ),
                      _buildButton(title: "Save", onTap: ()=>Navigator.pop(context)),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
  void showCreateDetailedPopup({required BuildContext context, required String projectId, required String title}){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context){
          return AlertDialog(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                    color: Colors.black
                )
            ),
            backgroundColor: Colors.white,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, style: TextStyle(
                    fontSize: 1.t,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),),
                SizedBox(
                  height: 2.h,
                ),
                _buildField(hintText: "Enter Paint Name", controller: TextEditingController()),
                SizedBox(
                  height: 1.h,
                ),
                _buildField(hintText: "Enter Paint Code", controller: TextEditingController()),
                SizedBox(
                  height: 1.h,
                ),
                _buildFilePicker(fileName: "Pick a paint image", onTap: (){}),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  width: 500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildButton(title: "Cancel", onTap: ()=>Navigator.pop(context)),
                      SizedBox(
                        width: 3.w,
                      ),
                      _buildButton(title: "Save", onTap: ()=>Navigator.pop(context)),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
  void showPreview({required BuildContext context, required String content}){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
                color: Colors.black,
                width: 1.0
            )
        ),
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.close_rounded, color: Colors.black,)),
            ),
            SizedBox(
              height: 30.h,
              width: 50.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(content),
              ),
            )
          ],
        ),
      );
    });
  }
  void showDetailedPreview({required BuildContext context, required String content, required String title, required String subtitle}){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
                color: Colors.black,
                width: 1.0
            )
        ),
        backgroundColor: Colors.white,
        content: Container(
          height: 30.h,
          width: 50.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.close_rounded, color: Colors.black,)),
              ),
              ListTile(
                title: Text(title, style: TextStyle(
                  fontSize: 1.5.t,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),),
                subtitle: Text(subtitle, style: TextStyle(
                  fontSize: 1.t,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),),
              ),
              SizedBox(
                height: 20.h,
                width: 50.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(content),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
  _buildButton({required String title, required VoidCallback onTap}){
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.blue,
        ),
        alignment: Alignment.center,
        child: Text(title, style: TextStyle(
            fontSize: 0.9.t,
            color: Colors.white
        ),),
      ),
    );
  }
  _buildField({required String hintText, required TextEditingController controller}){
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.0
              )
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.0
              )
          ),
          hintText: hintText
      ),
    );
  }
  _buildFilePicker({required String fileName, required VoidCallback onTap}){
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
              color: Colors.black,
              width: 1.0
          ),
        ),
        alignment: Alignment.centerLeft,
        child: Text(fileName, textAlign: TextAlign.left, style: TextStyle(
            fontSize: 1.t,
            fontWeight: FontWeight.w500,
            color: Colors.black
        ),),
      ),
    );
  }
}
