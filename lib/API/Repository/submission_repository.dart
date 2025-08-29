import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import '../../Constants/app_constant.dart';
import '../Model/Request/submission_request.dart';
import '../api_client.dart';

class SubmissionRepository{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  const SubmissionRepository({required this.apiClient, required this.sharedPreferences});

  Future<Response> getSubmissionList(String id) async {
    return await apiClient.getData(getSubmissionsUrl(id));
  }

  Future<Response> floorPlanSubmission(SubmissionRequest request, List<MultipartBody> multipartBody) async{
    return await apiClient.postMultipartData(floorPlanSubmissionUrl, request.toJson(), multipartBody);
  }

  Future<Response> threeDPlanSubmission(SubmissionRequest request, List<MultipartBody> multipartBody) async{
    return await apiClient.postMultipartData(threeDPlanSubmissionUrl, request.toJson(), multipartBody);
  }

  Future<Response> interiorPlanSubmission(SubmissionRequest request, List<MultipartBody> multipartBody) async{
    return await apiClient.postMultipartData(interiorPlanSubmissionUrl, request.toJson(), multipartBody);
  }

  Future<Response> structuralPlanSubmission(SubmissionRequest request, List<MultipartBody> multipartBody) async{
    return await apiClient.postMultipartData(structuralPlanSubmissionUrl, request.toJson(), multipartBody);
  }

  Future<Response> electricalPlanSubmission(SubmissionRequest request, List<MultipartBody> multipartBody) async{
    return await apiClient.postMultipartData(electricalPlanSubmissionUrl, request.toJson(), multipartBody);
  }

  Future<Response> plumbingPlanSubmission(SubmissionRequest request, List<MultipartBody> multipartBody) async{
    return await apiClient.postMultipartData(plumbingPlanSubmissionUrl, request.toJson(), multipartBody);
  }

}