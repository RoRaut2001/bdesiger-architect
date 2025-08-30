import 'package:flutter/material.dart';
import '../../../../Helper/responsive.dart';
import 'electrical_drawing_submission_mobile.dart';
import 'electrical_drawing_submission_web.dart';

class ElectricalDrawingSubmission extends StatelessWidget {
  ElectricalDrawingSubmission({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: ElectricalDrawingSubmissionMobile(),
        tablet: ElectricalDrawingSubmissionWeb(),
        desktop: ElectricalDrawingSubmissionWeb());
  }
}
