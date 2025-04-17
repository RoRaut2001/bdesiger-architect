import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:b_designer_architecture/Model/report_model.dart';
import 'package:flutter/material.dart';

class ThreeDPlanChart extends StatelessWidget {
  final ThreeDPlan threeDPlan;
  const ThreeDPlanChart({super.key, required this.threeDPlan});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 10.h,
      width: 10.w,
      color: Colors.red,
      child: Text("Three D Plan"),
    );
  }
}
