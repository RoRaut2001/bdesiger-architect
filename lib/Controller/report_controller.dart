import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../API/Repository/report_repository.dart';
import '../API/api_client.dart';
import '../Model/report_model.dart';

class ReportController extends GetxController{
  final ReportRepository reportRepo;
  ReportController({required this.reportRepo});


  var newReports = <ReportModel>[].obs;
  var pendingReports = <ReportModel>[].obs;
  var completedReports = <ReportModel>[].obs;
  var isLoading = false.obs;
  var currentPage = 1.obs;
  var expandedCardIds = <String, RxBool>{}.obs;

  void toggleExpanded(String id) {
    if (!expandedCardIds.containsKey(id)) {
      expandedCardIds[id] = false.obs;
    }
    expandedCardIds[id]!.value = !expandedCardIds[id]!.value;
  }

  bool isCardExpanded(String id) {
    return expandedCardIds[id]?.value ?? false;
  }


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

  /**** update the revisions counts in report ****/
  final picker = ImagePicker();

  // Temporary variables (shared for all)
  Rxn<XFile> tempMobileFile = Rxn<XFile>();
  Rxn<Uint8List> tempWebBytes = Rxn<Uint8List>();
  // RxString tempLabel = ''.obs;

  final totalRevision = TextEditingController();
  final remainingRevision = TextEditingController();
  final extraRevision = TextEditingController();

  void setValues({required String total, required String remaining, required String extra}) {
    totalRevision.text = total;
    remainingRevision.text = remaining;
    extraRevision.text = extra;
  }

  /**** images list from each plan in reports ****/
  final RxList<MultipartBody> twoDFloorPlan = <MultipartBody>[].obs;
  final RxList<MultipartBody> threeDElevationImage = <MultipartBody>[].obs;
  final RxList<MultipartBody> interiorElevationImage = <MultipartBody>[].obs;
  final RxList<MultipartBody> structureDesign = <MultipartBody>[].obs;
  final RxList<MultipartBody> electricalDesign = <MultipartBody>[].obs;
  final RxList<MultipartBody> plumbingDesign = <MultipartBody>[].obs;
  final RxList<MultipartBody> threeD360VRImages = <MultipartBody>[].obs;
  final RxList<MultipartBody> interior360VRImages = <MultipartBody>[].obs;
  final RxList<MultipartBody> threeDFloorPlan = <MultipartBody>[].obs;
  final RxList<MultipartBody> sectionAndElevationPlan = <MultipartBody>[].obs;

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

  void addImageToList(RxList<MultipartBody> targetList, String key) {

    if (kIsWeb && tempWebBytes.value != null) {
      targetList.add(
        MultipartBody(key: key, webBytes: tempWebBytes.value!),
      );
    } else if (!kIsWeb && tempMobileFile.value != null) {
      targetList.add(
        MultipartBody(
          key: key,
          file: tempMobileFile.value!,
        ),
      );
    }
    // Reset temp state
    tempWebBytes.value = null;
    tempMobileFile.value = null;
  }

  /****  select files and files preview ****/

  final RxList<MultipartBody> documentFiles = <MultipartBody>[].obs;
  final RxList<MultipartBody> threeDDocumentFiles = <MultipartBody>[].obs;
  final RxList<MultipartBody> interiorDocumentFiles = <MultipartBody>[].obs;
  final RxList<MultipartBody> ar3DModel = <MultipartBody>[].obs;
  final RxList<MultipartBody> interiorAr3DModel = <MultipartBody>[].obs;
  final RxList<MultipartBody> elevationDimensions = <MultipartBody>[].obs;
  final RxList<MultipartBody> interiorElevationDimensions = <MultipartBody>[].obs;

  final Rxn<PlatformFile> tempPickedFile = Rxn<PlatformFile>();
  final Rxn<Uint8List> tempFileWebBytes = Rxn<Uint8List>();

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(withData: true);
    if (result != null && result.files.isNotEmpty) {
      tempPickedFile.value = result.files.first;
      tempFileWebBytes.value = result.files.first.bytes;
    }
  }

  void addFileToList(RxList<MultipartBody> targetList, String key) {
    final file = tempPickedFile.value;
    if (file == null || file.bytes == null) return;

    targetList.add(
      MultipartBody(
        key: key,
        webBytes: file.bytes,
        filename: file.name,
      ),
    );

    tempPickedFile.value = null;
    tempFileWebBytes.value = null;
  }


}