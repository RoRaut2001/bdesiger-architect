import 'package:b_designer_architecture/API/Repository/report_repository.dart';
import 'package:b_designer_architecture/Model/report_model.dart';
import 'package:get/get.dart';

class ReportController extends GetxController{
  final ReportRepository reportRepo;
  ReportController({required this.reportRepo});


  var newReports = <ReportModel>[].obs;
  var pendingReports = <ReportModel>[].obs;
  var completedReports = <ReportModel>[].obs;
  var isLoading = false.obs;
  var currentPage = 1.obs;


  @override
  void onInit() {
    super.onInit();
    fetchReports();
  }

  Future<void> fetchReports() async {
    final String uid = await reportRepo.sharedPreferences.getString("uid") ?? "";
    try {
      isLoading(true);
      Response response = await reportRepo.fetchReports();
      if (response.statusCode == 200) {
        final data = response.body;
        if (data != null && data['projects'] != null) {
          var fetchedReports = (data['projects'] as List)
              .map((project) => ReportModel.fromJson(project))
              .toList();

          // Filter reports based on status

          newReports.assignAll(
            fetchedReports.where((report) => report.status == "created").toList(),
          );

          pendingReports.assignAll(
            fetchedReports.where((report) => report.status == "pending" && report.architectId == uid).toList(),
          );

          completedReports.assignAll(
            fetchedReports.where((report) => report.status == "completed" && report.architectId == uid).toList(),
          );

        } else {
          print("No projects found in the response.");
          Get.snackbar("No Data", "No projects found.");
        }
      } else {
        print("Error: ${response.statusText}");
        Get.snackbar("Error", "Failed to fetch reports. Status: ${response.statusCode}");
      }
    } catch (err) {
      print("Exception: $err");
      Get.snackbar("Oops!", "Something went wrong.");
    } finally {
      isLoading(false);
    }
  }


  Future<void> requestProject(String projectId) async{
    try{
      isLoading(true);
      final String architectId = await reportRepo.sharedPreferences.getString("uid") ?? "";
      Response response = await reportRepo.requestProject(projectId, architectId);
      if(response.statusCode == 200){
        Get.snackbar("Success", "Please wait for approval from consultant");
        fetchReports();
      }else{
        Get.snackbar("Oops!", "Something went wrong");
        print(response.body);
      }
    }catch(err){
        print("Exception: $err");
        Get.snackbar("Oops!", "Something went wrong");
    }finally{
      isLoading(false);
    }
  }
}