import 'package:b_designer_architecture/Constants/app_constant.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api_client.dart';

class ReportRepository {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  ReportRepository({required this.apiClient, required this.sharedPreferences});

  Future<Response> fetchReports() async{
    return await apiClient.getData(fetchReportUrl);
  }

  Future<Response> requestProject(String projectId, String architectId) async{
    return await apiClient.postData(requestProjectUrl, {
      "projectId": projectId,
      "architectId": architectId
    });
  }


}
