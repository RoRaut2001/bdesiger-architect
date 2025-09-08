import 'dart:developer';
import 'package:b_designer_architecture/API/Repository/help_support_repository.dart';
import 'package:get/get.dart';

import '../API/Model/help_and_support.dart';
import '../Helper/toast_messages.dart';


class HelpAndSupportController extends GetxController {
  final HelpAndSupportRepository helpSupportRepository;

  HelpAndSupportController({required this.helpSupportRepository});

  var isLoading = false.obs;
  var architectSettings = ArchitectSetting().obs;

  @override
  void onInit() {
    fetchClientSettings();
    super.onInit();
  }

  Future<void> fetchClientSettings() async {
    isLoading.value = true;
    print("Fetch Setting Called");
    try {
      Response response = await helpSupportRepository.getClientSettings();
      if(response.statusCode == 200){
        print('Fetched Settings JSON: ${response.body['data']['formFillingPage']}');
        architectSettings.value = ArchitectSetting.fromJson(response.body['data']);
      }
    } catch (e) {
      showError(Get.context!, "Exception in fetch setting",);
      log("Exception in Fetch Settings: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
