import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../API/Model/Request/account_page_setting_dto.dart';
import '../API/Model/Request/home_page_setting_dto.dart';
import '../API/Model/Request/set_form_filling_page_setting_dto.dart';
import '../API/Model/Request/set_login_page_setting_dto.dart';
import '../API/Model/Request/set_report_page_setting_dto.dart';
import '../API/Model/Request/video_page_setting_dto.dart';
import '../API/Model/charge_model.dart';
import '../API/Repository/client_repository.dart';
import '../API/api_client.dart';
import '../Helper/toast_messages.dart';

//TODO : need to change the logic for dynamic charges fetching and set to static fields

class ClientController extends GetxController {
  final ClientRepository clientRepo;
  ClientController({required this.clientRepo});

  final Map<String, dynamic>? responseData = {};

  var isEditing = false.obs;
  var isPrivacyEditing = false.obs;
  RxBool isLoading = false.obs;
  RxString loginPageVideoUrl = ''.obs;

  var agreementText = ''.obs;
  var termsAndConditionText = ''.obs;
  var privacyAndPolicyText = ''.obs;

  /**** This holds multiple sections, each with multiple charge items ****/
  RxList<ChargeSection> sections = <ChargeSection>[].obs;
  RxList<ChargeSection> homeSections = <ChargeSection>[].obs;
  RxList<ChargeSection> dayLeftSection = <ChargeSection>[].obs;
  RxList<ChargeSection> twoDFloorPlanRevisionsChargesDiscounts = <ChargeSection>[].obs;
  RxList<ChargeSection> threeElevationPlanRevisionsChargesDiscounts = <ChargeSection>[].obs;
  RxList<ChargeSection> interiorPlanRevisionsChargesDiscounts = <ChargeSection>[].obs;
  RxList<ChargeSection> electricalPlanRevisionsChargesDiscounts = <ChargeSection>[].obs;
  RxList<ChargeSection> structuralPlanRevisionsChargesDiscounts = <ChargeSection>[].obs;
  RxList<ChargeSection> plumbingPlanRevisionsChargesDiscounts = <ChargeSection>[].obs;

  /**** initialize all fill form data with fetching current values from database ****/
  void initializeData() async {
    isLoading.value = true;
    try {
      final response = await clientRepo.getAdminSettings();
      if (response.statusCode == 200) {
        responseData?.addAll(response.body['data']);
        fetchLoginPageVideoUrl();
        fetchHomePageVideosFromApi();
        fetchVideoContentFromApi();
        fetchReportPageSetting();
        fetchAccountPageSetting();
        final Map<String, dynamic>? formData = responseData?['formFillingPage'];
        if (formData == null) {
          sections.value = [];
          homeSections.value = [];
          dayLeftSection.value = [];
          twoDFloorPlanRevisionsChargesDiscounts.value = [];
          threeElevationPlanRevisionsChargesDiscounts.value = [];
          interiorPlanRevisionsChargesDiscounts.value = [];
          videoUrl1.value = '';
          interiorImages.clear();
          elevationSamples.clear();
          isLoading.value = false;
          return;
        }

        /**** Extract maps with null-checking and fallback to empty maps ****/
        final interiorDesignDetails = Map<String, dynamic>.from(formData['interiorDesignDetails'] ?? {});
        final interiorFeatures = Map<String, dynamic>.from(formData['interiorFeatures'] ?? {});
        final threeDElevationDesign = Map<String, dynamic>.from(formData['threeDElevationDesign'] ?? {});
        final interiorDesignType = Map<String, dynamic>.from(formData['interiorDesignType'] ?? {});
        final threeDElevationViews = Map<String, dynamic>.from(formData['threeDElevationViews'] ?? {});
        final threeDElevationFeatures = Map<String, dynamic>.from(formData['threeDElevationFeatures'] ?? {});
        final threeDFloorPlan = Map<String, dynamic>.from(formData['threeDFloorPlan'] ?? {});
        final floorPlanDesignType = Map<String, dynamic>.from(formData['floorPlanDesignType'] ?? {});

        final perFloorCharge = (formData['perFloorCharge'] as num?)?.toDouble() ?? 0.0;
        final floorLimit = (formData['floorLimit'] as num?)?.toDouble() ?? 0.0;

        double getPriceSafely(dynamic value) {
          return (value as num?)?.toDouble() ?? 0.0;
        }

        /**** Set sections using backend data ****/
        sections.value = [
          ChargeSection(
            sectionName: 'Floor Charge & Limit',
            items: [
              ChargeItem(label: 'Per Floor Charges', price: perFloorCharge),
              ChargeItem(label: 'Floor Limit', price: floorLimit),
            ],
          ),
          ChargeSection(
            sectionName: 'Floor Plan Design Type',
            items: floorPlanDesignType.entries
                .map((e) => ChargeItem(label: e.key, price: getPriceSafely(e.value)))
                .toList(),
          ),
          ChargeSection(
            sectionName: '3D Floor Plan Design',
            items: threeDFloorPlan.entries
                .map((e) => ChargeItem(label: e.key, price: getPriceSafely(e.value)))
                .toList(),
          ),
          ChargeSection(
            sectionName: '3D Elevation Design Type',
            items: threeDElevationDesign.entries
                .map((e) => ChargeItem(label: e.key, price: getPriceSafely(e.value)))
                .toList(),
          ),
          ChargeSection(
            sectionName: '3D Elevation Features',
            items: threeDElevationFeatures.entries
                .map((e) => ChargeItem(label: e.key, price: getPriceSafely(e.value)))
                .toList(),
          ),
          ChargeSection(
            sectionName: '3D Elevation Views',
            items: threeDElevationViews.entries
                .map((e) => ChargeItem(label: e.key, price: getPriceSafely(e.value)))
                .toList(),
          ),
          ChargeSection( // Duplicate 'Per Floor Charges' - consider if this is intended
            sectionName: 'Per Floor Charges',
            items: [
              ChargeItem(label: 'Per Floor Charges', price: perFloorCharge),
            ],
          ),
          ChargeSection(
            sectionName: 'Interior Design Type',
            items: interiorDesignType.entries
                .map((e) => ChargeItem(label: e.key, price: getPriceSafely(e.value)))
                .toList(),
          ),
          ChargeSection(
            sectionName: 'Interior Design Details',
            items: interiorDesignDetails.entries
                .map((e) => ChargeItem(label: e.key, price: getPriceSafely(e.value)))
                .toList(),
          ),
          ChargeSection(
            sectionName: 'Interior Features',
            items: interiorFeatures.entries
                .map((e) => ChargeItem(label: e.key, price: getPriceSafely(e.value)))
                .toList(),
          ),
        ];

        /**** Homepage-specific sections ****/
        homeSections.value = [
          ChargeSection(
            sectionName: 'Floor Charge & Limit',
            items: [
              ChargeItem(label: 'Per Floor Charges', price: perFloorCharge),
              ChargeItem(label: 'Floor Limit', price: floorLimit),
            ],
          ),
        ];

        /**** days left -specific sections ****/
        dayLeftSection.value = [
          ChargeSection(
            sectionName: 'Days Left Update',
            items: [
              ChargeItem(label: 'Days Left', price: perFloorCharge),
              ChargeItem(label: 'Percentage of Work Done', price: floorLimit),
            ],
          ),
        ];

        /**** 2d floor plan charges and discount sections ****/
        twoDFloorPlanRevisionsChargesDiscounts.value = [
          ChargeSection(
            sectionName: '2D Floor Plan Charges',
            items: [
              ChargeItem(label: '2D Floor Plan Revision', price: perFloorCharge), // Replace with actual 2D revision charge
              ChargeItem(label: 'Discount For Multiple Revision', price: floorLimit), // Replace with actual 2D discount
            ],
          ),
        ];

        /**** 3d elevation plan charges and discount sections ****/
        threeElevationPlanRevisionsChargesDiscounts.value = [
          ChargeSection(
            sectionName: '3D Elevation Plan Charges',
            items: [
              ChargeItem(label: '3D Elevation Plan Revision', price: perFloorCharge), // Replace with actual 3D revision charge
              ChargeItem(label: 'Discount For Multiple Revision', price: floorLimit), // Replace with actual 3D discount
            ],
          ),
        ];

        /**** interior elevation plan charges and discount sections ****/
        interiorPlanRevisionsChargesDiscounts.value = [
          ChargeSection(
            sectionName: 'Interior Plan Charges',
            items: [
              ChargeItem(label: 'Interior Plan Revision', price: perFloorCharge), // Replace with actual interior revision charge
              ChargeItem(label: 'Discount For Multiple Revision', price: floorLimit), // Replace with actual interior discount
            ],
          ),
        ];

        /**** electrical  plan charges and discount sections ****/
        electricalPlanRevisionsChargesDiscounts.value = [
          ChargeSection(
            sectionName: 'Electrical Plan Charges',
            items: [
              ChargeItem(label: 'Electrical Plan Revision', price: perFloorCharge), // Replace with actual electrical revision charge
              ChargeItem(label: 'Discount For Multiple Revision', price: floorLimit), // Replace with actual electrical discount
            ],
          ),
        ];

        /**** structural  plan charges and discount sections ****/
        structuralPlanRevisionsChargesDiscounts.value = [
          ChargeSection(
            sectionName: 'Structure Plan Charges',
            items: [
              ChargeItem(label: 'Structure Plan Revision', price: perFloorCharge), // Replace with actual structural revision charge
              ChargeItem(label: 'Discount For Multiple Revision', price: floorLimit), // Replace with actual structural discount
            ],
          ),
        ];

        /**** plumbing  plan charges and discount sections ****/
        plumbingPlanRevisionsChargesDiscounts.value = [
          ChargeSection(
            sectionName: 'Plumbing Plan Charges',
            items: [
              ChargeItem(label: 'Plumbing Plan Revision', price: perFloorCharge), // Replace with actual plumbing revision charge
              ChargeItem(label: 'Discount For Multiple Revision', price: floorLimit), // Replace with actual plumbing discount
            ],
          ),
        ];
        /**** Update 2D/3D video URL ****/
        videoUrl1.value = formData['twoDThreeDVideo'] ?? '';
        /**** Clear and prepare image/sample lists if needed ****/
        interiorImages.clear();
        elevationSamples.clear();
      } else {
        Get.snackbar("Error", response.body['message'] ?? "Failed to load data from server.");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong while loading data. Please try again.");
      print("initializeData exception: $e");
    } finally {
      isLoading.value = false;
    }
  }
  /**** set from-filling pages updated values ****/
  Future<void> setFormFillingPageSetting(BuildContext context) async {
    isLoading.value = true;
    try {
      /**** Helper to find a ChargeSection by its name ****/
      ChargeSection? _findSection(String sectionName) {
        return sections.firstWhereOrNull((s) => s.sectionName == sectionName);
      }

      /**** Helper to find a ChargeItem within a section by its label ****/
      ChargeItem? _findItem(ChargeSection? section, String itemLabel) {
        if (section == null) return null;
        return section.items
            .firstWhereOrNull((item) => item.label == itemLabel);
      }
      String? _getSectionItemsAsJsonString(String sectionName) {
        final section = _findSection(sectionName);
        if (section == null || section.items.isEmpty) return null;

        final Map<String, num> itemsMap = {};
        for (var item in section.items) {
          itemsMap[item.label] =
              item.price.value;
        }
        return jsonEncode(itemsMap);
      }

      // 1. Extract values from `sections` and `videoUrl1`
      final String? twoDThreeDVideo = videoUrl1.value.isEmpty ? null : videoUrl1.value;
      final ChargeSection? floorChargeLimitSection = _findSection('Floor Charge & Limit');
      final num? floorLimit = _findItem(floorChargeLimitSection, 'Floor Limit')?.price.value;
      final num? perFloorCharge = _findItem(floorChargeLimitSection, 'Per Floor Charges')?.price.value;
      final String? floorPlanDesignType = _getSectionItemsAsJsonString('Floor Plan Design Type');
      final String? threeDFloorPlan = _getSectionItemsAsJsonString('3D Floor Plan Design');
      final String? threeDElevationDesign = _getSectionItemsAsJsonString('3D Elevation Design Type');
      final String? threeDElevationFeatures = _getSectionItemsAsJsonString('3D Elevation Features');
      final String? threeDElevationViews = _getSectionItemsAsJsonString('3D Elevation Views');
      final String? interiorDesignType = _getSectionItemsAsJsonString('Interior Design Type');
      final String? interiorDesignDetails = _getSectionItemsAsJsonString('Interior Design Details');

      // 2. Prepare metadata lists for image fields (no change here)
      List<String>? interiorSamplesMetadata = interiorImages.map((mb) => mb.key).toList();
      if (interiorSamplesMetadata.isEmpty) interiorSamplesMetadata = null;

      List<String>? threeDElevationSamplesMetadata = elevationSamples.map((mb) => mb.key).toList();
      if (threeDElevationSamplesMetadata.isEmpty) threeDElevationSamplesMetadata = null;

      final SetFormFillingPageSettingDTO requestBody =
      SetFormFillingPageSettingDTO(
        twoDThreeDVideo: twoDThreeDVideo,
        floorLimit: floorLimit,
        perFloorCharge: perFloorCharge,
        floorPlanDesignType: floorPlanDesignType,
        threeDFloorPlan: threeDFloorPlan,
        threeDElevationDesign: threeDElevationDesign,
        threeDElevationFeatures: threeDElevationFeatures,
        threeDElevationViews: threeDElevationViews,
        interiorDesignType: interiorDesignType,
        interiorDesignDetails: interiorDesignDetails,
        interiorSamplesMetadata: interiorSamplesMetadata,
        threeDElevationSamplesMetadata: threeDElevationSamplesMetadata,
      );

      /****  Convert RxList<MultipartBody> to List<XFile> for the API call ****/
      List<XFile> interiorSampleFiles = [];
      for (var mb in interiorImages) {
        if (mb.file != null) {
          interiorSampleFiles.add(mb.file!);
        } else if (mb.webBytes != null) {
          interiorSampleFiles.add(XFile.fromData(mb.webBytes!, name: mb.key));
        }
      }

      List<XFile> threeDElevationSampleFiles = [];
      for (var mb in elevationSamples) {
        if (mb.file != null) {
          threeDElevationSampleFiles.add(mb.file!);
        } else if (mb.webBytes != null) {
          threeDElevationSampleFiles
              .add(XFile.fromData(mb.webBytes!, name: mb.key));
        }
      }

      Response response = await clientRepo.setFormFillingPageSetting(
        requestBody,
        interiorSampleFiles,
        threeDElevationSampleFiles,
      );

      if (response.statusCode == 200) {
        showSuccess(context, "Form Filling Page Settings Updated Successfully");
      } else {
        showError(context, response.body['message']);
      }
    } catch (err) {
      if (kDebugMode)
        print("Exception in setFormFillingPageSetting: " + err.toString());
      showError(context, "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }

  /**** Convert full data to JSON for database submission ****/
  List<Map<String, dynamic>> toJson() {
    return sections.map((section) => section.toJson()).toList();
  }

  /**** Video url grid ****/
  //login pages intro video-- fetching url from database
  Future<void> fetchLoginPageVideoUrl() async {
    try {
      loginPageVideoUrl.value = responseData?['loginPage']['introVideo'];
    } catch (e) {
      if (kDebugMode) {
        print("Exception in fetchLoginPageVideoUrl: $e");
      }
    } finally {
      isLoading.value = false;
    }
  }
  // setting new updated url form admin panel
  Future<void> setLoginPageVideoUrl(BuildContext context) async {
    isLoading.value = true;
    try {
      final dto = SetLoginPageSettingDTO(introVideo: loginPageVideoUrl.value);
      final response = await clientRepo.setLoginPageSetting(dto);
      if (response.statusCode == 200) {
        showSuccess(context, "Video URL updated successfully");
      } else {
        showError(context, response.body['message']);
      }
    } catch (err) {
      if (kDebugMode) {
        print("Exception in setLoginPageVideoUrl: $err");
      }
      showError(context, "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }

  /**** client settings---- video pages ****/
  //video pages url list
  Future<void> setVideoContentPage(BuildContext context) async{
    isLoading.value = true;
    try{
      final videoPageSettingDTO = VideoPageSettingDTO(
        content: videoUrlData.map((item) => VideoPageContent(
          title: item['title'],
          link: item['url'].value,
        )).toList(),
      );
      final response = await clientRepo.setVideoPageSetting(videoPageSettingDTO);
      if (response.statusCode == 200) {
        print('Data uploaded successfully');
        showSuccess(context, "Video Updated Successfully");
      } else {
        showError(context, "Failed to upload data. Status code: ${response.statusCode}");
      }
    }catch(err){
      if (kDebugMode) print("Exception: " + err.toString());
      showError(context, "Something went wrong");
    }finally{
      isLoading.value = false;
    }
  }
  RxList<Map<String, dynamic>> videoUrlData = <Map<String, dynamic>>[].obs;

  Future<void> fetchVideoContentFromApi() async {
    try {
      final data = responseData?['videoContent'];
      if (data is List && data.isNotEmpty) {
        final videos = data.map<Map<String, dynamic>>((e) {
          return {
            'title': e['title'] ?? '',
            'url': (e['link'] ?? '').toString().obs,
          };
        }).toList();
        videoUrlData.assignAll(videos);
      }
    } catch (e) {
      print('Exception fetching video content: $e');

    }
  }

  void addVideoUrl(String title, String url) {
    videoUrlData.add({'title': title, 'url': url.obs});
  }

  void updateUrl(int index, String newUrl) {
    videoUrlData[index]['url'].value = newUrl;
  }

  String getVideoDataAsJson() {
    return jsonEncode(
      videoUrlData
          .map((item) => {
        'title': item['title'],
        'url': (item['url'] as RxString).value,
      })
          .toList(),
    );
  }

  //home pages video url list
  Future<void> setHomePageSetting(BuildContext context) async {
    isLoading.value = true;
    try {
      List<ProjectReviewVideo> projectReviewVideosList = homepagesVideoUrlData
          .map((map) => ProjectReviewVideo(
        title: map['title'],
        link: (map['url'] as RxString).value,
      )).toList();
      List<CivilEngineerContact> civilEngineerContactList = engineerList.value
          .map((map) => CivilEngineerContact.fromJson(map))
          .toList();

      List<String>? bannerMetaData = banner.map((mb) => mb.key).toList();
      if (bannerMetaData.isEmpty) bannerMetaData = null;

      List<XFile> bannerFiles = [];
      for (var mb in banner) {
        if (mb.file != null) {
          bannerFiles.add(mb.file!);
        } else if (mb.webBytes != null) {
          // Create XFile from webBytes, using key as name
          bannerFiles.add(XFile.fromData(mb.webBytes!, name: mb.key));
        }
      }
      final HomePageSettingDTO request = HomePageSettingDTO(
          civilEngineerContact: civilEngineerContactList,
          projectReviewVideo: projectReviewVideosList,
          bannerMetaData: bannerMetaData);

      Response response =
      await clientRepo.setHomePageSetting(request, bannerFiles);
      if (response.statusCode == 200) {
        showSuccess(context, "Home Page Settings Updated Successfully");
      } else {
        showError(context, response.body['message']);
      }
    } catch (err) {
      showError(context, "Something went wrong");
      if (kDebugMode) print("Exception: " + err.toString());
    } finally {
      isLoading.value = false;
    }
  }

  RxList<Map<String, dynamic>> homepagesVideoUrlData = <Map<String, dynamic>>[].obs;

  Future<void> fetchHomePageVideosFromApi() async {
    try {
      final data = responseData?['homePage']?['projectReviewVideo'];
      if (data is String && data.isNotEmpty) {
        final List<dynamic> decoded = jsonDecode(data);
        final videos = decoded.map<Map<String, dynamic>>((e) {
          return {
            'title': e['title'] ?? '',
            'url': (e['link'] ?? '').toString().obs,
          };
        }).toList();
        homepagesVideoUrlData.assignAll(videos);
      }
    } catch (e) {
      print('Exception fetching homepage video data: $e');
      showError( Get.context!, 'Something went wrong');
    }
  }

  void homepagesAddVideoUrl(String title, String url) {
    homepagesVideoUrlData.add({'title': title, 'url': url.obs});
  }

  void homepagesUpdateUrl(int index, String newUrl) {
    homepagesVideoUrlData[index]['url'].value = newUrl;
  }

  String homepagesGetVideoDataAsJson() {
    return jsonEncode(
      homepagesVideoUrlData
          .map((item) => {
        'title': item['title'],
        'url': (item['url'] as RxString).value,
      })
          .toList(),
    );
  }

  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  void toggleEditMode() {
    isEditing.value = !isEditing.value;
  }

  void togglePrivacyEditMode() {
    isPrivacyEditing.value = !isPrivacyEditing.value;
  }

  void updateTermsConditions(String newTermsConditionText) {
    termsAndConditionText.value = newTermsConditionText;
    print("Terms Updated: $newTermsConditionText");
  }

  void updatePrivacyPolicy(String newPrivacyPolicyText) {
    privacyAndPolicyText.value = newPrivacyPolicyText;
    print("Privacy Updated: $newPrivacyPolicyText");
  }

  var reviews = <Map<String, dynamic>>[].obs;

  /**** Report Page Setting ****/
  Future<void> fetchReportPageSetting() async {
    try {
      final reportPage = responseData?['reportPage'];
      final fetchedAgreement = reportPage?['agreementForClient'];
      if (fetchedAgreement != null) {
        agreementText.value = fetchedAgreement;
      }
    } catch (e) {
      print('Exception in fetchReportPageSetting: $e');
      showError(Get.context!, 'Something went wrong');
    }
  }

  Future<void> setReportPageSetting(BuildContext context) async {
    isLoading.value = true;
    try {
      Response response = await clientRepo.setReportPageSetting(
          SetReportPageSettingDTO(agreementForClient: agreementText.value));
      if (response.statusCode == 200) {
        showSuccess(context, "Agreement Updated Successfully");
      } else {
        showError(context, response.body['message']);
      }
    } catch (err) {
      if (kDebugMode)
        print("Exception in Client Setting Service: " + err.toString());
      showError(context, "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }

  void addReview({
    required String name,
    required String address,
    required int rating,
    required String comment,
  }) {
    reviews.add({
      "name": name,
      "address": address,
      "rating": rating,
      "comment": comment,
    });
  }

  var engineerList = [].obs;

  void addEngineer({
    required String name,
    required String address,
    required String projects,
    required String website,
    required String mobile,
    required String comment,
    Uint8List? imageBytes,
  }) {
    final newEngineer = {
      "name": name,
      "address": address,
      "projects": projects,
      "website": website,
      "mobile": mobile,
      "comment": comment,
      "image": imageBytes,
    };

    engineerList.add(newEngineer);
  }

  final tempUrl = ''.obs;
  final videoUrl = ''.obs; //login page introduction video url
  final videoUrl1 = ''.obs; //form-filling pages 2D & 3D video url
  final videoUrl2 = ''.obs;

  Future<void> updateVideoUrl(String url, RxString target) async {
    print("Uploading $url to DB...");
    await Future.delayed(
        const Duration(seconds: 1));
    target.value = url;
    tempUrl.value = '';
  }

  Future<void> previewUrl(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      await launchUrl(uri);
    } catch (err) {
      print("Exception: " + err.toString());
    }
  }

  final picker = ImagePicker();

  //---- Temporary variables (shared for all)
  Rxn<XFile> tempMobileFile = Rxn<XFile>();
  Rxn<Uint8List> tempWebBytes = Rxn<Uint8List>();
  RxString tempLabel = ''.obs;

  //---- Different image+label lists for each use-case
  final RxList<MultipartBody> elevationSamples = <MultipartBody>[].obs;
  final RxList<MultipartBody> electricalDrawings = <MultipartBody>[].obs;
  final RxList<MultipartBody> interiorImages = <MultipartBody>[].obs;
  final RxList<MultipartBody> banner = <MultipartBody>[].obs;

  Future<void> pickImage() async {
    final XFile? picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked == null) return;

    if (kIsWeb) {
      final bytes = await picked.readAsBytes();
      tempWebBytes.value = bytes;
      tempMobileFile.value = null;
    } else {
      tempMobileFile.value = XFile(picked.path);
      tempWebBytes.value = null;
    }
  }

  void setTempLabel(String value) => tempLabel.value = value;

  void addImageToList(RxList<MultipartBody> targetList) {
    if (tempLabel.isEmpty) return;

    if (kIsWeb && tempWebBytes.value != null) {
      targetList.add(
        MultipartBody(key: tempLabel.value, webBytes: tempWebBytes.value!),
      );
    } else if (!kIsWeb && tempMobileFile.value != null) {
      targetList.add(
        MultipartBody(
          key: tempLabel.value,
          file: tempMobileFile.value!,
        ),
      );
    }

    // Reset temp state
    tempWebBytes.value = null;
    tempMobileFile.value = null;
    tempLabel.value = '';
  }

  /**** account pages  ****/
  Future<void> fetchAccountPageSetting() async {
    try {
      final accountPage = responseData?['accountPage'];
      final fetchedPrivacy = accountPage?['privacyPolicy'];
      final fetchedTerms = accountPage?['termsAndCondition'];
      if (fetchedPrivacy != null) {
        privacyAndPolicyText.value = fetchedPrivacy;
      }
      if (fetchedTerms != null) {
        termsAndConditionText.value = fetchedTerms;
      }
    } catch (e) {
      print('Exception in fetchAccountPageSetting: $e');
      showError(Get.context!, 'Something went wrong');
    }
  }

  Future<void> setAccountPage(BuildContext context) async{
    isLoading.value = true;
    try{
      final AccountPageSettingDTO request = AccountPageSettingDTO(
        privacyPolicy: privacyAndPolicyText.value,
        termsAndCondition: termsAndConditionText.value,
      );
      Response response =  await clientRepo.setAccountPageSetting(request);
      if (response.statusCode == 200) {
        showSuccess(context, "Account Page Settings Updated Successfully");
      } else {
        showError(context, response.body['message']);
      }
    }catch(err){
      if (kDebugMode) print("Exception: " + err.toString());
      showError(context, "Something went wrong");
    }finally{
      isLoading.value = false;
    }
  }
}
