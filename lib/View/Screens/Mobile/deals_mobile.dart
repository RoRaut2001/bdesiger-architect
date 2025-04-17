import 'package:b_designer_architecture/Components/Buttons/pagination_button.dart';
import 'package:b_designer_architecture/Components/Cards/deals_toggle.dart';
import 'package:b_designer_architecture/Components/Cards/project_card.dart';
import 'package:b_designer_architecture/Controller/screen_controller.dart';
import 'package:b_designer_architecture/Controller/report_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Model/report_model.dart';

class DealsMobile extends StatelessWidget {
  DealsMobile({super.key, required this.controller});

  final ScreenController controller;
  final ReportController reportController = Get.find<ReportController>();

  final int itemsPerPage = 6;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DealsToggle(
          onSelect: (index) {
            controller.selectedDealIndex.value = index;
          },
          labels: ["New", "Pending", "Completed"],
        ),
        SizedBox(height: 20),
        Expanded(
          child: Obx(() {
            if (reportController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else if (reportController.newReports.isEmpty) {
              return Center(child: Text("No Data Available"));
            } else {
              // Calculate the paginated data
              final startIndex = (reportController.currentPage.value - 1) * itemsPerPage;
              final endIndex = startIndex + itemsPerPage;
              final paginatedReports = reportController.newReports.sublist(
                startIndex,
                endIndex > reportController.newReports.length ? reportController.newReports.length : endIndex,
              );

              return ListView.builder(
                itemCount: paginatedReports.length,
                itemBuilder: (context, index) {
                  final ReportModel report = paginatedReports[index];
                  return IntrinsicHeight(
                    child: ProjectCard(report: report, onGetDeal: () {
                      reportController.requestProject(paginatedReports[index].projectId!);
                    }, onForwardDeal: () {
                      paginatedReports.removeAt(index);
                      controller.update();
                    },),
                  );
                },
              );
            }
          }),
        ),
        SizedBox(height: 20),
        Obx(() {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Previous Button
                    GestureDetector(
                      onTap: () {
                        if (reportController.currentPage.value > 1) {
                          reportController.currentPage.value--;
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(Icons.chevron_left, color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 10),
                    // Page Buttons
                    Row(
                      children: List.generate(
                        (reportController.newReports.length / itemsPerPage).ceil(),
                            (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: PaginationButton(
                            index: index,
                            isSelected: index + 1 == reportController.currentPage.value,
                            onTap: () {
                              reportController.currentPage.value = index + 1;
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    // Next Button
                    GestureDetector(
                      onTap: () {
                        if (reportController.currentPage.value < (reportController.newReports.length / itemsPerPage).ceil()) {
                          reportController.currentPage.value++;
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(Icons.chevron_right, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Results Text
                Text(
                  "Results: ${((reportController.currentPage.value - 1) * itemsPerPage) + 1} - ${((reportController.currentPage.value) * itemsPerPage).clamp(0, reportController.newReports.length)} of ${reportController.newReports.length}",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

