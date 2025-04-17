import 'package:b_designer_architecture/Helper/responsive.dart';
import 'package:b_designer_architecture/View/Screens/Web/project_details_web.dart';
import 'package:flutter/material.dart';

class ProjectDetails extends StatelessWidget {
  const ProjectDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(mobile: ProjectDetailsWeb(), tablet: ProjectDetailsWeb(), desktop: ProjectDetailsWeb());
  }
}
