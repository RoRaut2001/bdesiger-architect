import 'package:flutter/material.dart';
import '../../../../../helper/responsive.dart';
import 'floor_plan_submission_mobile.dart';
import 'floor_plan_submission_web.dart';

class FloorPlanSubmission extends StatelessWidget {
  FloorPlanSubmission({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: FloorPlanSubmissionMobile(),
        tablet: FloorPlanSubmissionWeb(),
        desktop: FloorPlanSubmissionWeb());
  }
}
