
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Components/Cards/Submission plan cards/charge_section_widget_mobile.dart';
import '../../../../Components/DropDowns/deals_widget.dart';
import '../../../../Constants/constant_asset.dart';
import '../../../../Controller/client_controller.dart';
import '../../../../Model/report_model.dart';

class SubmissionMainPageMobile extends StatelessWidget {
  SubmissionMainPageMobile({super.key});

  final ClientController controller = Get.find<ClientController>();

  @override
  Widget build(BuildContext context) {
    final report = ModalRoute.of(context)?.settings.arguments as ReportModel?;
    final selectedServices = report?.commonData?.selectedServices ?? [];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Navigator.pop(context, report),
          child: const Icon(Icons.arrow_back_rounded, size: 25, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                tileColor: Colors.white,
                title: Text(
                  "Project - ${selectedServices.join(", ")}",
                  style: TextStyle(
                    fontSize: 12,
                    color: const Color(0xFF656565),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  report?.createdBy ?? "NA",
                  style: TextStyle(
                    fontSize: 9,
                    color: const Color(0xFF656565),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 3,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                ),
                children: [
                  if (selectedServices.contains("Floor Plan"))
                    _buildSubmissionCard(
                      title: "2D Floor Plan",
                      icon: kaFloorPlan,
                      onTap: () => Navigator.pushNamed(context, '/floor-plan-submission',arguments: report),
                    ),
                  if (selectedServices.contains("3D Elevation"))
                    _buildSubmissionCard(
                      title: "3D Elevation",
                      icon: kaThreeD,
                      onTap: () => Navigator.pushNamed(context, '/three-d-plan-submission',arguments: report),
                    ),
                  if (selectedServices.contains("Interior"))
                    _buildSubmissionCard(
                      title: "Interior Design",
                      icon: kaInterior,
                      onTap: () => Navigator.pushNamed( context, '/interior-submission', arguments: report),
                    ),
                  if (selectedServices.contains("Structure"))
                    _buildSubmissionCard(
                      title: "Structure Design",
                      icon: kaStructure,
                      onTap: () => Navigator.pushNamed( context, '/structure-design-submission', arguments: report),
                    ),
                  if (selectedServices.contains("Electrical"))
                    _buildSubmissionCard(
                      title: "Electric Design",
                      icon: kaElectrical,
                      onTap: () => Navigator.pushNamed(context, '/electrical-drawing-submission', arguments: report),
                    ),
                  if (selectedServices.contains("Plumbing"))
                    _buildSubmissionCard(
                      title: "Plumbing Design",
                      icon: kaPlumbing,
                      onTap: () => Navigator.pushNamed(context, '/plumbing-design-submission', arguments: report),
                    ),
                  if (selectedServices.isNotEmpty)
                    _buildSubmissionCard(
                      title: "Estimation",
                      icon: kaFloorPlan,
                      onTap: () => Navigator.pushNamed(context, '/estimation-submission', arguments: report),
                    ),
                ],
              ),
              const SizedBox(height: 40),
              const Text(
                'Current Stage Update',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 4),
              Container(height: 2, width: 130, color: Colors.black),
              const SizedBox(height: 30),
              DealsWidget(),
              const SizedBox(height: 30),
              Obx(()=>
              controller.isLoading.value? Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ): ListView.builder(
                shrinkWrap: true,
                itemCount: controller.dayLeftSection.length,
                itemBuilder: (_, index) {
                  final section = controller.dayLeftSection[index];
                  return ChargeSectionWidgetMobile(section: section);
                },
              )
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmissionCard({
    required String title,
    required VoidCallback onTap,
    required String icon,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.black, width: 0.5),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(3.0),
        alignment: Alignment.center,
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            "Update the data",
            style: TextStyle(fontSize: 10, color: const Color(0xFF7B7B7B)),
          ),
          leading: Image.network(icon, width: 30, height: 30),
          trailing: const Icon(Icons.arrow_forward, color: Colors.black, size: 20),
        ),
      ),
    );
  }
}
