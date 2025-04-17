import 'package:b_designer_architecture/Constants/constant_color.dart';
import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:b_designer_architecture/Model/report_model.dart';
import 'package:flutter/material.dart';

class CommonDataChart extends StatelessWidget {
  final CommonData commonData;
  const CommonDataChart({super.key, required this.commonData});

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
          crossAxisAlignment: CrossAxisAlignment.center,
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
                  DataColumn(label: Text("General Information")),
                  DataColumn(label: Text("")),
                ],
                rows: [
                  DataRow(
                      cells: [
                        DataCell(
                            Text(
                                "Client Name"
                            )
                        ),
                        DataCell(
                            Text(
                                commonData.createdBy!
                            )
                        ),
                      ]),
                  DataRow(
                      cells: [
                        DataCell(
                            Text(
                                "Total Buildup Area"
                            )
                        ),
                        DataCell(
                            Text(
                                commonData.totalBuildupArea!.toString()
                            )
                        ),
                      ]),
                  DataRow(
                      cells: [
                        DataCell(
                            Text(
                                "Floors"
                            )
                        ),
                        DataCell(
                            Text(
                                "G+${(commonData.floorCount!-1).toString()}"
                            )
                        ),
                      ]),
                  DataRow(
                      cells: [
                        DataCell(
                            Text(
                                "Landing Front Facing"
                            )
                        ),
                        DataCell(
                            Text(
                                commonData.homeFrontFacing!
                            )
                        ),
                      ]),
                  DataRow(
                      cells: [
                        DataCell(
                            Text(
                                "According to vastu standard"
                            )
                        ),
                        DataCell(
                            Text(
                                commonData.isVastuStandard!
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
                  DataColumn(label: Text("Family Details")),
                  DataColumn(label: Text("")),
                ],
                rows: [
                  DataRow(
                      cells: [
                        DataCell(
                            Text(
                                "Family Members"
                            )
                        ),
                        DataCell(
                            Text(
                                commonData.familyMemberCount!.toString()
                            )
                        ),
                      ]),
                  DataRow(
                      cells: [
                        DataCell(
                            Text(
                                "Total No. of Bikes"
                            )
                        ),
                        DataCell(
                            Text(
                                commonData.bike?.toString() ?? "0"
                            )
                        ),
                      ]),
                  DataRow(
                      cells: [
                        DataCell(
                            Text(
                                "Total No. of Card"
                            )
                        ),
                        DataCell(
                            Text(
                                commonData.cars?.toString() ?? "0"
                            )
                        ),
                      ]),
                  DataRow(
                      cells: [
                        DataCell(
                            Text(
                                "Total No. of SUVs"
                            )
                        ),
                        DataCell(
                            Text(
                                commonData.suv?.toString() ?? "0"
                            )
                        ),
                      ]),
                  DataRow(
                      cells: [
                        DataCell(
                            Text(
                                "According to vastu standard"
                            )
                        ),
                        DataCell(
                            Text(
                                commonData.isVastuStandard!
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
                  DataColumn(label: Text("Plot Area")),
                  DataColumn(label: Text("")),
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
                                commonData.plotArea!.frontSide?.toString() ?? "0"
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
                                commonData.plotArea!.backSide?.toString() ?? "0"
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
                                commonData.plotArea!.leftSide?.toString() ?? "0"
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
                                commonData.plotArea!.rightSide?.toString() ?? "0"
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
                  DataColumn(label: Text("Build Up Area")),
                  DataColumn(label: Text("Ground Floor")),
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
                                commonData.builtupArea!.frontSide?.toString() ?? "0"
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
                                commonData.builtupArea!.backSide?.toString() ?? "0"
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
                                commonData.builtupArea!.leftSide?.toString() ?? "0"
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
                                commonData.builtupArea!.rightSide?.toString() ?? "0"
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
