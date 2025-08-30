import 'package:flutter/material.dart';
import '../../../../Helper/responsive.dart';
import 'interior_submission_mobile.dart';
import 'interior_submission_web.dart';

class InteriorSubmission extends StatelessWidget {
  InteriorSubmission({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: InteriorSubmissionMobile(),
        tablet: InteriorSubmissionWeb(),
        desktop: InteriorSubmissionWeb());
  }
}
