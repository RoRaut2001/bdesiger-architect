import 'package:b_designer_architecture/API/Repository/profile_repository.dart';
import 'package:b_designer_architecture/API/Repository/report_repository.dart';
import 'package:b_designer_architecture/Controller/auth_controller.dart';
import 'package:b_designer_architecture/Controller/billing_controller.dart';
import 'package:b_designer_architecture/Controller/chat_controller.dart';
import 'package:b_designer_architecture/Controller/help_and_support_controller.dart';
import 'package:b_designer_architecture/Controller/profile_controller.dart';
import 'package:b_designer_architecture/Controller/report_controller.dart';
import 'package:b_designer_architecture/Controller/sidebar_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../API/Repository/auth_repository.dart';
import '../API/Repository/submission_repository.dart';
import '../API/api_client.dart';
import '../Constants/app_constant.dart';
import '../Controller/screen_controller.dart';
import '../Controller/submission_controller.dart';


Future<void> init() async{
  final sharedPreferences = await SharedPreferences.getInstance();

  /**** ApiRepositories ****/
  Get.lazyPut(()=>ApiClient(appBaseUrl: baseurl, sharedPreferences: sharedPreferences));
  Get.lazyPut(()=>sharedPreferences);
  Get.lazyPut(()=>AuthRepository(sharedPreferences: sharedPreferences, apiClient: Get.find()), fenix: true);
  Get.lazyPut(()=>ReportRepository(sharedPreferences: sharedPreferences, apiClient: Get.find()), fenix: true);
  Get.lazyPut(()=>ProfileRepository(sharedPreferences: sharedPreferences, apiClient: Get.find()), fenix: true);
  Get.lazyPut(()=>SubmissionRepository(sharedPreferences: sharedPreferences, apiClient: Get.find()), fenix: true);


  Get.lazyPut(()=>AuthController(authRepo: Get.find()), fenix: true);
  Get.lazyPut(()=>SubmissionController(submissionRepository: Get.find<SubmissionRepository>()), fenix: true);
  Get.lazyPut(()=>SidebarController(), fenix: true);
  Get.lazyPut(()=>ScreenController(), fenix: true);
  Get.lazyPut(()=>ChatController(), fenix: true);
  Get.lazyPut(()=>HelpAndSupportController(), fenix: true);
  Get.lazyPut(()=>ReportController(reportRepo: Get.find()), fenix: true);
  Get.lazyPut(()=>ProfileController(profileRepo: Get.find()), fenix: true);
  Get.lazyPut(()=>BillingController(), fenix: true);

}