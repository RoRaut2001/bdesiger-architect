import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Constants/app_constant.dart';
import '../Model/Request/account_page_setting_dto.dart';
import '../Model/Request/home_page_setting_dto.dart';
import '../Model/Request/set_form_filling_page_setting_dto.dart';
import '../Model/Request/set_login_page_setting_dto.dart';
import '../Model/Request/set_report_page_setting_dto.dart';
import '../Model/Request/video_page_setting_dto.dart';
import '../api_client.dart';


class ClientRepository{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  const ClientRepository({required this.apiClient, required this.sharedPreferences});

  Future<Response> getAdminSettings() async {
    return await apiClient.getData("admin/setting");
  }

  Future<Response> setLoginPageSetting(SetLoginPageSettingDTO request) async{
    return await apiClient.postData(adminSettingUrl+loginPageSettingUrl, request.toJson());
  }

  Future<Response> getLoginPageSetting() async {
    return await apiClient.getData(adminSettingUrl + loginPageSettingUrl);
  }

  Future<Response> setReportPageSetting(SetReportPageSettingDTO request) async{
    return await apiClient.postData(adminSettingUrl+reportPageSettingUrl, request.toJson());
  }

  Future<Response> setFormFillingPageSetting(
      SetFormFillingPageSettingDTO requestBody,
      List<XFile> interiorSamples,
      List<XFile> threeDElevationSamples,
      ) async {
    List<MultipartBody> fileFields = [];

    //---- Add interior samples to fileFields
    for (XFile file in interiorSamples) {
      fileFields.add(MultipartBody(key: "interiorSamples", file: file));
    }

    //---- Add threeDElevation samples to fileFields
    for (XFile file in threeDElevationSamples) {
      fileFields.add(MultipartBody(key: "threeDElevationSamples", file: file));
    }

    return await apiClient.postMultipartData(
      adminSettingUrl + formFillingSettingUrl,
      requestBody.toJson(),
      fileFields,
    );
  }

  Future<Response> setHomePageSetting(
      HomePageSettingDTO requestBody,
      List<XFile> banners,
      ) async {
    List<MultipartBody> fileFields = [];

    //---- Add interior samples to fileFields
    for (XFile file in banners) {
      fileFields.add(MultipartBody(key: "banners", file: file));
    }

    return await apiClient.postMultipartData(
      adminSettingUrl + homePageSettingUrl,
      requestBody.toJson(),
      fileFields,
    );
  }

  Future<Response>setVideoPageSetting(VideoPageSettingDTO request) async{
    return await apiClient.postData(adminSettingUrl+videoPageSettingUrl, request.toJson());
  }

  Future<Response>setAccountPageSetting(AccountPageSettingDTO request) async{
    return await apiClient.postData(adminSettingUrl+accountPageSettingUrl, request.toJson());
  }

  Future<Response> setNeedHelpPages(Map<String, List<Map<String, dynamic>>> jsonData) async{
    return await apiClient.postData(adminSettingUrl+needHelpPageSettingUrl, jsonData);
  }
}