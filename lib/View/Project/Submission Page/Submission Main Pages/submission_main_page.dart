
import 'package:b_designer_architecture/View/Project/Submission%20Page/Submission%20Main%20Pages/submission_main_page_mobile.dart';
import 'package:b_designer_architecture/View/Project/Submission%20Page/Submission%20Main%20Pages/submission_main_page_tab.dart';
import 'package:b_designer_architecture/View/Project/Submission%20Page/Submission%20Main%20Pages/submission_main_page_web.dart';
import 'package:flutter/material.dart';
import '../../../../helper/responsive.dart';

class SubmissionMainPage extends StatelessWidget {
  SubmissionMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: SubmissionMainPageMobile(),
        tablet: SubmissionMainPageTab(),
        desktop: SubmissionMainPageWeb());
  }
}
