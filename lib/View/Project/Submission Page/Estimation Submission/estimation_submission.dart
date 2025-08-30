import 'package:flutter/material.dart';

import '../../../../Helper/responsive.dart';
import 'estimation_submission_mobile.dart';
import 'estimation_submission_web.dart';

class EstimationSubmission extends StatelessWidget {
  EstimationSubmission({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: EstimationSubmissionMobile(),
        tablet: EstimationSubmissionWeb(),
        desktop: EstimationSubmissionWeb());
  }
}
