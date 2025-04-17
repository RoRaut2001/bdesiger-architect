import 'package:b_designer_architecture/Constants/app_constant.dart';
import 'package:get/get_connect/connect.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Model/user_model.dart';
import '../api_client.dart';

class ProfileRepository {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  ProfileRepository({required this.apiClient, required this.sharedPreferences});

  Future<Response> getProfile() async{
    return await apiClient.getData(fetchProfileUrl);
  }

  Future<Response> updateArchitect(UserModel request, List<MultipartBody> multipartBody) async {
    return await apiClient.postMultipartData(registerUrl, request.toJson(), multipartBody);
  }



}
