import 'package:b_designer_architecture/API/Model/Request/register_architect_request.dart';
import 'package:b_designer_architecture/Model/user_model.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Constants/app_constant.dart';
import '../Model/Request/verify_user_request.dart';
import '../api_client.dart';

class AuthRepository {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepository({required this.apiClient, required this.sharedPreferences});

  Future<Response> verifyUser(VerifyUserRequest req) async {
    return await apiClient.postData(verifyUserUrl, req.toJson());
  }

  Future<Response> sendOtp(String phoneNumber) async {
    return await apiClient.postData(sendOtpUrl, {
      "phoneNumber": phoneNumber
    });
  }

  Future<Response> verifyOtp(String phoneNumber, String otp) async {
    return await apiClient.postData(verifyOtpUrl, {
      "phoneNumber": phoneNumber,
      "otp": otp
    });
  }

  Future<Response> login(String email, String password) async{
    return await apiClient.postData(loginUrl, {
      "email": email,
      "password": password
    });
  }

  Future<Response> registerArchitect(RegisterArchitectRequest request, List<MultipartBody> multipartBody) async {
    return await apiClient.postMultipartData(registerUrl, request.toJson(), multipartBody);
  }

  Future<Response> fetchProfile() async {
    return await apiClient.getData(fetchProfileUrl);
  }

  Future<Response> getMyRatings() async {
    return await apiClient.getData(getMyRatingsUrl);
  }

  Future<Response> updateArchitect(UserModel request, List<MultipartBody> multipartBody) async {
    return await apiClient.postMultipartData(updateUrl, request.toJson(), multipartBody);
  }
}
