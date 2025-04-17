import 'package:b_designer_architecture/Components/Cards/footer.dart';
import 'package:b_designer_architecture/Components/Cards/project_card_pending.dart';
import 'package:b_designer_architecture/Controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:b_designer_architecture/Components/Buttons/pagination_button.dart';
import 'package:b_designer_architecture/Components/Cards/deals_toggle.dart';
import 'package:b_designer_architecture/Components/Cards/project_card.dart';
import 'package:b_designer_architecture/Controller/screen_controller.dart';
import 'package:b_designer_architecture/Controller/report_controller.dart';
import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:b_designer_architecture/Model/report_model.dart';

class DealsWeb extends StatelessWidget {
  DealsWeb({super.key, required this.controller});

  final ScreenController controller;
  final ReportController reportController = Get.find<ReportController>();
  final ChatController chatController = Get.find<ChatController>();
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
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          color: Colors.transparent,
          width: SizeConfig.screenWidth,
          padding: EdgeInsets.all(20.0),
          height: 55.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DealsToggle(
                onSelect: (index) {
                  controller.selectedDealIndex.value = index;
                  reportController.currentPage.value = 1;
                },
                labels: ["New", "Pending", "Completed"],
              ),
              SizedBox(height: 20),
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

                    return GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 1.45
                      ),
                      itemCount: paginatedReports.length,
                      itemBuilder: (context, index) {
                        return IntrinsicHeight(
                          child: controller.selectedDealIndex.value != 0 ? ProjectCardPending(report: paginatedReports[index]) : ProjectCard(report: paginatedReports[index], onGetDeal: () {
                            reportController.requestProject(paginatedReports[index].projectId!);
                          }, onForwardDeal: (){
                          paginatedReports.removeAt(index);
                          reportController.update();
                          }),
                        );
                      },
                    );
                  }
                }),
              ),
              Obx(() {
                final selectedReports = getSelectedReports(controller.selectedDealIndex.value);
                return Container(
                  color: Colors.transparent,
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
                          SizedBox(width: 10),
                          Row(
                            children: List.generate(
                              (selectedReports.length / itemsPerPage).ceil(),
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
                      SizedBox(height: 10),
                      Text(
                        "Results: ${((reportController.currentPage.value - 1) * itemsPerPage) + 1} - ${(reportController.currentPage.value * itemsPerPage).clamp(0, selectedReports.length)} of ${selectedReports.length}",
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
          ),
        ),
        Footer()
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
