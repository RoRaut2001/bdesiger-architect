import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:b_designer_architecture/Model/report_model.dart';
import 'package:flutter/material.dart';

import '../../Constants/constant_color.dart';

class FloorPlanChart extends StatelessWidget {
  final FloorPlan floorPlan;
  const FloorPlanChart({super.key, required this.floorPlan});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      alignment: Alignment.topLeft,
      width: 10.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
              color: kcNavyBlue
          )
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DataTable(
                headingRowColor: WidgetStatePropertyAll(Colors.grey.withAlpha(50)),
                headingTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 1.2.t
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: kcNavyBlue
                    ),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                border: TableBorder(
                  horizontalInside: BorderSide(
                      color: kcNavyBlue
                  ),
                  verticalInside: BorderSide(
                      color: kcNavyBlue
                  ),
                ),
                columns: [
                  DataColumn(label: Text("Architectural Floor Plan")),
                  DataColumn(label: Text("")),
                ],
                rows: [
                  DataRow(
                      cells: [
                        DataCell(
                            Text(
                                "Elevation Type"
                            )
                        ),
                        DataCell(
                            Text(
                                floorPlan.elevationType!
                            )
                        ),
                      ]),
                  DataRow(
                      cells: [
                        DataCell(
                            Text(
                                "Floor Plan Type"
                            )
                        ),
                        DataCell(
                            Text(
                                floorPlan.floorPlanType?.join(", ") ?? "NA"
                            )
                        ),
                      ]),
                ]),
            SizedBox(width: 5.w,),
            DataTable(
                headingRowColor: WidgetStatePropertyAll(Colors.grey.withAlpha(50)),
                headingTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 1.2.t
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: kcNavyBlue
                    ),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                border: TableBorder(
                  horizontalInside: BorderSide(
                      color: kcNavyBlue
                  ),
                  verticalInside: BorderSide(
                      color: kcNavyBlue
                  ),
                ),
                columns: [
                  DataColumn(label: Text("Side Margins")),
                  DataColumn(label: Text("(In ft.)")),
                ],
                rows: [
                  DataRow(
                      cells: [
                        DataCell(
                            Text(
                                "Front Side"
                            )
                        ),
                        DataCell(
                            Text(
                                floorPlan.sideMargin!.frontSide?.toString() ?? "0"
                            )
                        ),
                      ]),
                  DataRow(
                      cells: [
                        DataCell(
                            Text(
                                "Back Side"
                            )
                        ),
                        DataCell(
                            Text(
                                floorPlan.sideMargin!.backSide?.toString() ?? "0"
                            )
                        ),
                      ]),
                  DataRow(
                      cells: [
                        DataCell(
                            Text(
                                "Left Side"
                            )
                        ),
                        DataCell(
                            Text(
                                floorPlan.sideMargin!.leftSide?.toString() ?? "0"
                            )
                        ),
                      ]),
                  DataRow(
                      cells: [
                        DataCell(
                            Text(
                                "Right Side"
                            )
                        ),
                        DataCell(
                            Text(
                                floorPlan.sideMargin!.rightSide?.toString() ?? "0"
                            )
                        ),
                      ]),
                ]),
            SizedBox(width: 5.w,),
            DataTable(
                headingRowColor: WidgetStatePropertyAll(Colors.grey.withAlpha(50)),
                headingTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 1.2.t
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: kcNavyBlue
                    ),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                border: TableBorder(
                  horizontalInside: BorderSide(
                      color: kcNavyBlue
                  ),
                  verticalInside: BorderSide(
                      color: kcNavyBlue
                  ),
                ),
                columns: [
                  DataColumn(label: Text("Side Details")),
                  DataColumn(label: Text("Surrounding Info")),
                ],
                rows: [
                  DataRow(
                      cells: [
                        DataCell(
                            Text(
                                "Front Side"
                            )
                        ),
                        DataCell(
                            Text(
                                floorPlan.sideDetails!.frontSide?.toString() ?? "0"
                            )
                        ),
                      ]),
                  DataRow(
                      cells: [
                        DataCell(
                            Text(
                                "Back Side"
                            )
                        ),
                        DataCell(
                            Text(
                                floorPlan.sideDetails!.backSide?.toString() ?? "0"
                            )
                        ),
                      ]),
                  DataRow(
                      cells: [
                        DataCell(
                            Text(
                                "Left Side"
                            )
                        ),
                        DataCell(
                            Text(
                                floorPlan.sideDetails!.leftSide?.toString() ?? "0"
                            )
                        ),
                      ]),
                  DataRow(
                      cells: [
                        DataCell(
                            Text(
                                "Right Side"
                            )
                        ),
                        DataCell(
                            Text(
                                floorPlan.sideDetails!.rightSide?.toString() ?? "0"
                            )
                        ),
                      ]),
                ]),
          ],
        ),
      ),
    );
  }
}
