import 'package:b_designer_architecture/Components/Cards/Project%20card/project_card_mobile.dart';
import 'package:b_designer_architecture/Components/Cards/Project%20card/project_card_tab.dart';
import 'package:b_designer_architecture/Components/Cards/Project%20card/project_card_web.dart';
import 'package:flutter/material.dart';

import '../../../Helper/responsive.dart';
import '../../../Model/report_model.dart';

class ProjectCard extends StatelessWidget {
  final ReportModel report;
  final VoidCallback assignConsultant;
  final VoidCallback assignArchitect;

  const ProjectCard({
    super.key,
    required this.report,
    required this.assignConsultant,
    required this.assignArchitect,
  });

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: ProjectCardMobile(
        report: report,
        assignConsultant: assignConsultant,
        assignArchitect: assignArchitect,
      ),
      tablet: ProjectCardTab(
        report: report,
        assignConsultant: assignConsultant,
        assignArchitect: assignArchitect,
      ),
      desktop: ProjectCardWeb(
        report: report,
        assignConsultant: assignConsultant,
        assignArchitect: assignArchitect,
      ),
    );
  }
}
