import 'package:b_designer_architecture/View/Project/Submission%20Page/Plumbing%20Design%20Submission/plumbing_design_submission_mobile.dart';
import 'package:b_designer_architecture/View/Project/Submission%20Page/Plumbing%20Design%20Submission/plumbing_design_submission_web.dart';
import 'package:flutter/material.dart';

import '../../../../Helper/responsive.dart';

class PlumbingDesignSubmission extends StatelessWidget {
  PlumbingDesignSubmission({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: PlumbingDesignSubmissionMobile(),
        tablet: PlumbingDesignSubmissionWeb(),
        desktop: PlumbingDesignSubmissionWeb());
  }
}
