import 'package:b_designer_architecture/View/Project/Submission%20Page/Structure%20Design%20Submission/structure_design_submission_mobile.dart';
import 'package:b_designer_architecture/View/Project/Submission%20Page/Structure%20Design%20Submission/structure_design_submission_web.dart';
import 'package:flutter/material.dart';

import '../../../../Helper/responsive.dart';

class StructureDesignSubmission extends StatelessWidget {
  StructureDesignSubmission({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: StructureDesignSubmissionMobile(),
        tablet: StructureDesignSubmissionWeb(),
        desktop: StructureDesignSubmissionWeb());
  }
}
