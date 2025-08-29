import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../API/Model/Request/submission_request.dart';
import '../API/Model/submission_model.dart';
import '../API/Repository/submission_repository.dart';
import '../API/api_client.dart';
import '../Helper/toast_messages.dart';

class SubmissionController extends GetxController {

  final SubmissionRepository submissionRepository;

  SubmissionController({required this.submissionRepository});

  var submission = Submission().obs;
  var isLoading = false.obs;
  final picker = ImagePicker();

  // Temporary variables (shared for all)
  Rxn<XFile> tempMobileFile = Rxn<XFile>();
  Rxn<Uint8List> tempWebBytes = Rxn<Uint8List>();

  /**** images list from each plan in reports ****/
  final RxList<MultipartBody> twoDFloorPlan = <MultipartBody>[].obs;
  final RxList<MultipartBody> elevation = <MultipartBody>[].obs;
  final RxList<MultipartBody> interiorElevationImage = <MultipartBody>[].obs;
  final RxList<MultipartBody> structureDesign = <MultipartBody>[].obs;
  final RxList<MultipartBody> electricalDesign = <MultipartBody>[].obs;
  final RxList<MultipartBody> plumbingDesign = <MultipartBody>[].obs;
  final RxList<MultipartBody> vrModel = <MultipartBody>[].obs;
  final RxList<MultipartBody> interior360VRImages = <MultipartBody>[].obs;
  final RxList<MultipartBody> threeDFloorPlan = <MultipartBody>[].obs;
  final RxList<MultipartBody> sectionAndElevationPlan = <MultipartBody>[].obs;
  final RxList<MultipartBody> documentFiles = <MultipartBody>[].obs;
  final RxList<MultipartBody> threeDDocument = <MultipartBody>[].obs;
  final RxList<MultipartBody> interiorDocumentFiles = <MultipartBody>[].obs;
  final RxList<MultipartBody> arModel = <MultipartBody>[].obs;
  final RxList<MultipartBody> interiorAr3DModel = <MultipartBody>[].obs;
  final RxList<MultipartBody> elevationDimensions = <MultipartBody>[].obs;
  final RxList<MultipartBody> interiorElevationDimensions = <MultipartBody>[].obs;
  final RxList<MultipartBody> elevationImage = <MultipartBody>[].obs;


  final Rxn<PlatformFile> tempPickedFile = Rxn<PlatformFile>();
  final Rxn<Uint8List> tempFileWebBytes = Rxn<Uint8List>();

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(withData: true);
    if (result != null && result.files.isNotEmpty) {
      tempPickedFile.value = result.files.first;
      tempFileWebBytes.value = result.files.first.bytes;
    }
  }

  void addFileToList(RxList<MultipartBody> targetList, String key, {BuildContext? context}) {
    final file = tempPickedFile.value;
    if (file == null || file.bytes == null) return;

    if(targetList.isNotEmpty){
      showWarning(context ?? Get.context!, "Only a single file can be uploaded at a time.");
      return;
    }

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

  void addImageToList(RxList<MultipartBody> targetList, String key, {BuildContext? context}) {

    if(targetList.isNotEmpty){
      showWarning(context ?? Get.context!, "Only a single image can be uploaded at a time.");
      return;
    } else {
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
    }
    // Reset temp state
    tempWebBytes.value = null;
    tempMobileFile.value = null;
  }


  /**** Fetch All Plan Submission ****/
  Future<void> fetchSubmissions(String id, BuildContext context) async {
    isLoading.value = true;
    try{
      Response response = await submissionRepository.getSubmissionList(id);
      if(response.statusCode == 200){
        submission.value = Submission.fromJson(response.body);
      } else {
        showError(context, response.body['message']);
      }
    }catch(err){
      showError(context, "Something went wrong");
    }finally{isLoading.value = false;}
  }
  /**** Floor Plan Submission ****/
  Future<void> floorPlanSubmission(BuildContext context, String projectId, int remainingRevision) async{
    isLoading.value = true;
    try{
      final SubmissionRequest request = SubmissionRequest(
        projectId: projectId,
        remainingRevision: remainingRevision
      );

      final List<MultipartBody> files = [
        ...twoDFloorPlan,
        ...threeDFloorPlan,
        ...sectionAndElevationPlan,
        ...documentFiles
      ];
      Response response = await submissionRepository.floorPlanSubmission(request, files);
      if(response.statusCode == 200){
        showSuccess(context, "Submission Successful");
        fetchSubmissions(projectId, context);
        twoDFloorPlan.clear();
        threeDFloorPlan.clear();
        sectionAndElevationPlan.clear();
        documentFiles.clear();
      } else {
        showError(context, response.body['message']);
      }
    }catch(err){
      showError(context, "Something went wrong");
      if (kDebugMode) {
        print(err.toString());
      }
    }finally{
      isLoading.value = false;
    }
  }
  /**** Three D Plan Submission ****/
  Future<void> threeDPlanSubmission(BuildContext context, String projectId, int remainingRevision) async{
    isLoading.value = true;
    try{
      final SubmissionRequest request = SubmissionRequest(
        projectId: projectId,
        remainingRevision: remainingRevision
      );

      final List<MultipartBody> files = [
        ...elevationImage,
        ...vrModel,
        ...arModel,
        ...elevation,
        ...threeDDocument
      ];
      Response response = await submissionRepository.threeDPlanSubmission(request, files);
      if(response.statusCode == 200){
        showSuccess(context, "Submission Successful");
        fetchSubmissions(projectId, context);
        elevationImage.clear();
        vrModel.clear();
        arModel.clear();
        threeDDocument.clear();
      } else {
        showError(context, response.body['message']);
      }
    }catch(err){
      showError(context, "Something went wrong");
      if (kDebugMode) {
        print(err.toString());
      }
    }finally{
      isLoading.value = false;
    }
  }
  /**** Interior Plan Submission ****/
  Future<void> interiorPlanSubmission(BuildContext context, String projectId, int remainingRevision) async{
    isLoading.value = true;
    try{
      final SubmissionRequest request = SubmissionRequest(
        projectId: projectId,
        remainingRevision: remainingRevision
      );

      final List<MultipartBody> files = [
        ...interiorElevationImage,
        ...interior360VRImages,
        ...interiorAr3DModel,
        ...interiorElevationDimensions,
        ...interiorDocumentFiles
      ];
      Response response = await submissionRepository.interiorPlanSubmission(request, files);
      if(response.statusCode == 200){
        showSuccess(context, "Submission Successful");
        fetchSubmissions(projectId, context);
        interiorElevationImage.clear();
        interior360VRImages.clear();
        interiorAr3DModel.clear();
        interiorElevationDimensions.clear();
        interiorDocumentFiles.clear();
      } else {
        showError(context, response.body['message']);
      }
    }catch(err){
      showError(context, "Something went wrong");
      if (kDebugMode) {
        print(err.toString());
      }
    }finally{
      isLoading.value = false;
    }
  }
  /**** Structural Plan Submission ****/
  Future<void> structuralPlanSubmission(BuildContext context, String projectId, int remainingRevision) async{
    isLoading.value = true;
    try{
      final SubmissionRequest request = SubmissionRequest(
        projectId: projectId,
        remainingRevision: remainingRevision
      );

      final List<MultipartBody> files = [
        ...structureDesign
      ];
      Response response = await submissionRepository.structuralPlanSubmission(request, files);
      if(response.statusCode == 200){
        showSuccess(context, "Submission Successful");
        fetchSubmissions(projectId, context);
        structureDesign.clear();
      } else {
        showError(context, response.body['message']);
      }
    }catch(err){
      showError(context, "Something went wrong");
      if (kDebugMode) {
        print(err.toString());
      }
    }finally{
      isLoading.value = false;
    }
  }
  /**** Electrical Plan Submission ****/
  Future<void> electricalPlanSubmission(BuildContext context, String projectId, int remainingRevision) async{
    isLoading.value = true;
    try{
      final SubmissionRequest request = SubmissionRequest(
        projectId: projectId,
        remainingRevision: remainingRevision
      );

      final List<MultipartBody> files = [
        ...electricalDesign
      ];
      Response response = await submissionRepository.electricalPlanSubmission(request, files);
      if(response.statusCode == 200){
        showSuccess(context, "Submission Successful");
        fetchSubmissions(projectId, context);
        electricalDesign.clear();
      } else {
        showError(context, response.body['message']);
      }
    }catch(err){
      showError(context, "Something went wrong");
      if (kDebugMode) {
        print(err.toString());
      }
    }finally{
      isLoading.value = false;
    }
  }
  /**** Plumbing Plan Submission ****/
  Future<void> plumbingPlanSubmission(BuildContext context, String projectId, int remainingRevision) async{
    isLoading.value = true;
    try{
      final SubmissionRequest request = SubmissionRequest(
        projectId: projectId,
        remainingRevision: remainingRevision
      );

      final List<MultipartBody> files = [
        ...plumbingDesign
      ];
      Response response = await submissionRepository.plumbingPlanSubmission(request, files);
      if(response.statusCode == 200){
        showSuccess(context, "Submission Successful");
        fetchSubmissions(projectId, context);
        plumbingDesign.clear();
      } else {
        showError(context, response.body['message']);
      }
    }catch(err){
      showError(context, "Something went wrong");
      if (kDebugMode) {
        print(err.toString());
      }
    }finally{
      isLoading.value = false;
    }
  }

}