import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Components/Buttons/pagination_button.dart';
import '../../../Components/Cards/Project card/project_card.dart';
import '../../../Components/Cards/deals_toggle.dart';
import '../../../Controller/report_controller.dart';
import '../../../Controller/screen_controller.dart';
import '../../../Model/report_model.dart';

class DealsMobile extends StatelessWidget {
  DealsMobile({super.key, required this.controller});

  final ScreenController controller;
  final ReportController reportController = Get.find<ReportController>();
  final int itemsPerPage = 6;

  List<ReportModel> getSelectedReports(int index) {
    switch (index) {
      case 1:
        return reportController.pendingReports;
      case 2:
        return reportController.completedReports;
      default:
        return reportController.newReports;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10,),
        DealsToggle(
          onSelect: (index) {
            controller.selectedDealIndex.value = index;
            reportController.currentPage.value = 1;
          },
          labels: ["New", "Pending", "Completed"],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Obx(() {
            final selectedReports = getSelectedReports(controller.selectedDealIndex.value);
            if (reportController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else if (selectedReports.isEmpty) {
              return Center(child: Text("No Data Available"));
            } else {
              final startIndex = (reportController.currentPage.value - 1) * itemsPerPage;
              final endIndex = (startIndex + itemsPerPage).clamp(0, selectedReports.length);
              final paginatedReports = selectedReports.sublist(startIndex, endIndex);
              return ListView.builder(
                itemCount: paginatedReports.length,
                itemBuilder: (context, index) {
                  final report = paginatedReports[index];
                  return  ProjectCard(report: paginatedReports[index], assignConsultant: () {  },
                    assignArchitect: () { Navigator.pushNamed(context, '/architect-table'); },);
                },
              );
            }
          }),
        ),
        const SizedBox(height: 20),
        Obx(() {
          final selectedReports = getSelectedReports(controller.selectedDealIndex.value);
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (reportController.currentPage.value > 1) {
                          reportController.currentPage.value--;
                        }
                      },
                      child: paginationArrow(Icons.chevron_left),
                    ),
                    const SizedBox(width: 10),
                    Row(
                      children: List.generate(
                        (selectedReports.length / itemsPerPage).ceil(),
                            (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: PaginationButton(
                            index: index,
                            isSelected: index + 1 == reportController.currentPage.value,
                            onTap: () {reportController.currentPage.value = index + 1;},
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        if (reportController.currentPage.value < (selectedReports.length / itemsPerPage).ceil()) {
                          reportController.currentPage.value++;
                        }
                      },
                      child: paginationArrow(Icons.chevron_right),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  "Results: ${((reportController.currentPage.value - 1) * itemsPerPage) + 1} - ${(reportController.currentPage.value * itemsPerPage).clamp(0, selectedReports.length)} of ${selectedReports.length}",
                  style: TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget paginationArrow(IconData icon) {
    return Container(
      height: 40,
      width: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Icon(icon, color: Colors.black),
    );
  }
}
