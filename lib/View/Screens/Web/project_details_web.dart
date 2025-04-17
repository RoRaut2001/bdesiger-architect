import 'package:b_designer_architecture/Components/Charts%20and%20Tables/common_data_chart.dart';
import 'package:b_designer_architecture/Components/Charts%20and%20Tables/floor_plan_chart.dart';
import 'package:b_designer_architecture/Components/Charts%20and%20Tables/interior_plan_chart.dart';
import 'package:b_designer_architecture/Components/Charts%20and%20Tables/three_d_plan_chart.dart';
import 'package:b_designer_architecture/Constants/constant_color.dart';
import 'package:b_designer_architecture/Controller/report_controller.dart';
import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:b_designer_architecture/Model/report_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProjectDetailsWeb extends StatelessWidget {
  ProjectDetailsWeb({super.key});

  final RxInt infoIndex = 0.obs;
  final RxList data = [].obs;
  final List<Color> serviceColors = [
    Colors.red,
    Colors.orangeAccent,
    Colors.lightGreen,
    Colors.deepPurple,
    Colors.amberAccent,
    Colors.pinkAccent,
    Colors.teal,
  ];


  List<Widget> getInfoScreen(ReportModel report) {
    return [
      if (report.commonData != null) CommonDataChart(commonData: report.commonData!),
      if (report.floorPlan != null) FloorPlanChart(floorPlan: report.floorPlan!),
      if (report.threeDPlan != null) ThreeDPlanChart(threeDPlan: report.threeDPlan!),
      if (report.interiorPlan != null) InteriorPlanChart(interiorPlan: report.interiorPlan!),
      if (report.floorPlan != null) FloorPlanChart(floorPlan: report.floorPlan!),
      if (report.floorPlan != null) FloorPlanChart(floorPlan: report.floorPlan!),
      if (report.floorPlan != null) FloorPlanChart(floorPlan: report.floorPlan!)
    ];
  }

  final ReportController controller = Get.find<ReportController>();

  @override
  Widget build(BuildContext context) {
    final report = ModalRoute.of(context)?.settings.arguments as ReportModel?;

    print("Report Data in Chat Screen: ${report?.toJson()}");

    if (report == null) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text("Project Details")),
        body: Center(child: Text('No report data available')),
      );
    }


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Project Details"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          SizedBox(height: 16),
          ListTile(
            title: SizedBox(
              height: 50, // Set a fixed height
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final String service = report.commonData?.selectedServices![index] ?? "NA";
                  return Chip(
                    label: Text(service,
                      style: TextStyle(
                        color: serviceColors[index],
                      ),
                    ),
                    side: BorderSide.none,
                    color: WidgetStatePropertyAll(serviceColors[index].withAlpha(50)),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 10); // Avoid using `.w` if not needed
                },
                itemCount: report.commonData!.selectedServices!.length,
              ),
            ),
            subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                report.commonData!.location ?? "NA",
                style: TextStyle(
                fontSize: 2.t
            ), // you can adjust font size here
              ),
              IconButton(
                icon: Icon(Icons.copy),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: report.commonData!.location ?? "No Location Found"));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Location copied to clipboard')),
                  );
                },
              ),
            ],
          ),
            trailing: report.status == "created" ? Obx(()=>
                controller.isLoading.value ? Center(
                  child: CircularProgressIndicator(
                    strokeCap: StrokeCap.round,
                    color: Colors.black,
                  ),
                ) :
                GetDealButton(onTap: (){
              controller.requestProject(report.projectId!);
              Get.back();
            })) : null,
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(report.commonData!.selectedServices!.length + 1, (index) {
              if (index == 0) {
                // First chip with default "General Information"
                if ((report.commonData!.selectedServices!.length == 1) && (report.commonData!.selectedServices!.contains("Interior"))){
                  infoIndex.value = 1;
                  return Container();
                } else{
                  return Obx(()=>GestureDetector(
                    onTap: ()=>infoIndex.value = index,
                    child: Chip(
                      label: Text("General Information", style: TextStyle(
                          color: infoIndex.value == index ? Colors.white : kcNavyBlue
                      ),),
                      backgroundColor: infoIndex.value == index ? kcNavyBlue : Colors.white,
                      side: BorderSide(
                          color: infoIndex.value == index ? Colors.white : kcNavyBlue
                      ),
                    ),
                  ));
                }
              } else {
                // Remaining chips with selected services
                return Obx(()=>GestureDetector(
                  onTap: ()=>infoIndex.value = index,
                  child: Chip(
                    label: Text(report.commonData!.selectedServices![index-1], style: TextStyle(
                        color: infoIndex.value == index ? Colors.white : kcNavyBlue
                    ),),
                    backgroundColor: infoIndex.value == index ? kcNavyBlue : Colors.white,
                    side: BorderSide(
                        color: infoIndex.value == index ? Colors.white : kcNavyBlue
                    ),
                  ),
                ));
              }
            }),
          ),
          SizedBox(
            height: 2.h,
          ),
          Obx(()=>getInfoScreen(report)[infoIndex.value]),
        ],
      ),
    );
  }
}

class GetDealButton extends StatelessWidget {
  final VoidCallback onTap;
  const GetDealButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: InkRipple.splashFactory,
      splashColor: kcNavyBlue.withAlpha(50),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0
        ),
        alignment: Alignment.center,
        width: 25.w,
        height: 2.5.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: kcNavyBlue
          ),
          borderRadius: BorderRadius.circular(5.0)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.screen_share_outlined, color: kcNavyBlue,),
            SizedBox(
              width: 2.w,
            ),
            Text("Get this deal", style: TextStyle(
              fontSize: 0.9.t,
              fontWeight: FontWeight.bold,
              color: kcNavyBlue
            ),)
          ],
        ),
      ),
    );
  }
}

