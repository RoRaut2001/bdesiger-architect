import 'package:b_designer_architecture/View/Auth/Login/login.dart';
import 'package:b_designer_architecture/View/Auth/sign_up.dart';
import 'package:b_designer_architecture/View/HelpAndSupport/Order%20Management/order_management.dart';
import 'package:b_designer_architecture/View/HelpAndSupport/Payment%20Withdrawls/payment_and_withdrawls.dart';
import 'package:b_designer_architecture/View/HelpAndSupport/Regulations%20Guidelines/regulations_guidelines.dart';
import 'package:b_designer_architecture/View/HelpAndSupport/Trust%20and%20Safety/trust_and_safety.dart';
import 'package:b_designer_architecture/View/HelpAndSupport/Your%20Account/your_account_support.dart';
import 'package:b_designer_architecture/View/Screens/Dashboard/dashboard.dart';
import 'package:b_designer_architecture/View/Screens/chat_screen.dart';
import 'package:b_designer_architecture/View/Screens/project_details.dart';
import 'package:b_designer_architecture/View/HelpAndSupport/help_and_support.dart';
import 'package:b_designer_architecture/auth_wrapper.dart';
import 'package:flutter/material.dart';
import 'View/Project/Submission Page/Submission Main Pages/submission_main_page.dart';
import 'View/Project/Submission Page/Electrical Drawing Submission/electrical_design_submission.dart';
import 'View/Project/Submission Page/Estimation Submission/estimation_submission.dart';
import 'View/Project/Submission Page/Floor plan submission/floor_plan_submission.dart';
import 'View/Project/Submission Page/Interior Submission/interior_submission.dart';
import 'View/Project/Submission Page/Plumbing Design Submission/plumbing_design_submission.dart';
import 'View/Project/Submission Page/Structure Design Submission/structure_design_submission.dart';
import 'View/Project/Submission Page/Three D Plan Submission/three_d_plan_submission.dart';

final Map<String, Widget Function(BuildContext)> routes = {
'/auth': (context)=> AuthWrapper(),
'/login': (context) => Login(),
'/dashboard': (context) => Dashboard(),
'/signup': (context) => SignUp(),
'/project-details': (context) => ProjectDetails(),
'/chat': (context) => ChatScreen(),
  '/submissionMainPage': (context) => SubmissionMainPage(),
  '/floor-plan-submission': (context) => FloorPlanSubmission(),
  '/three-d-plan-submission': (context) => ThreeDPlanSubmission(),
  '/interior-submission': (context) => InteriorSubmission(),
  '/structure-design-submission': (context) => StructureDesignSubmission(),
  '/electrical-drawing-submission': (context) => ElectricalDrawingSubmission(),
  '/plumbing-design-submission': (context) => PlumbingDesignSubmission(),
  '/estimation-submission': (context) => EstimationSubmission(),
  '/help-support': (context) => HelpAndSupport(),
  '/yourAccount': (context) => YourAccountSupport(),
  '/trustAndSafety': (context) => TrustAndSafety(),
  '/paymentsWithdrawals': (context) => PaymentAndWithdrawals(),
  '/orderManagement': (context) => OrderManagement(),
  '/regulationsGuidelines': (context) => RegulationsGuidelines(),
  // '/profile': (context) => Profile(controller: controller,),

};

