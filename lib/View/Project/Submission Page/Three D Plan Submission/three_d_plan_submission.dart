import 'package:b_designer_architecture/View/Project/Submission%20Page/Three%20D%20Plan%20Submission/three_d_plan_submission_mobile.dart';
import 'package:b_designer_architecture/View/Project/Submission%20Page/Three%20D%20Plan%20Submission/three_d_plan_submission_web.dart';
import 'package:flutter/material.dart';

import '../../../../Helper/responsive.dart';

class ThreeDPlanSubmission extends StatelessWidget {
  ThreeDPlanSubmission({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: ThreeDPlanSubmissionMobile(),
        tablet: ThreeDPlanSubmissionWeb(),
        desktop: ThreeDPlanSubmissionWeb());
  }
}
