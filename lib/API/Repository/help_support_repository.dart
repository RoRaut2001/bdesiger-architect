import 'package:get/get.dart';
import '../../Constants/app_constant.dart';
import '../api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelpAndSupportRepository{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  const HelpAndSupportRepository({required this.apiClient, required this.sharedPreferences});

  Future<Response> getClientSettings() async{
    return await apiClient.getData(adminSettingUrl);
  }
}