import 'dart:io';

import 'package:b_designer_architecture/API/Repository/profile_repository.dart';
import 'package:b_designer_architecture/Helper/toast_messages.dart';
import 'package:b_designer_architecture/View/Auth/Login/login.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../API/api_client.dart';
import '../Model/user_model.dart';


class ProfileController extends GetxController{

  final ProfileRepository profileRepo;
  ProfileController({required this.profileRepo});

  var userData = UserModel().obs;
  Rx<XFile> profilePicturePath = XFile("").obs;
  var isLoading = false.obs;
  var gender = ''.obs;
  var position = ''.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController villageController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController nameControllerBilling = TextEditingController();
  final TextEditingController lastNameControllerBilling = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController GSTController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateControllerBilling = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController postalController = TextEditingController();

  @override
  void onInit() {
    fetchProfile();
    super.onInit();
  }

  Future<void> fetchProfile() async{
    try{
      isLoading.value = true;
      Response response = await profileRepo.getProfile();
      if(response.statusCode == 200){
        userData.value = UserModel.fromJson(response.body);
      }else{
        showError(Get.context!, "Error fetching profile");
      }
    }catch(err){
        print("Exception: $err");
    }finally{
      isLoading.value = false;
    }
  }

  Future<void> updateProfile(BuildContext context, String uid) async{
    try {
      // Trimmed New Input Values
      String newName = nameController.text.trim();
      String newGender = gender.value;
      String newPosition = position.value;
      String newState = stateController.text.trim();
      String newTown = villageController.text.trim();
      String newEmail = emailController.text.trim();
      String newProfilePicturePath = profilePicturePath.value.path;

      // Existing Values from userData
      UserModel existingData = userData.value;

      // Check if any value has changed
      if (newName == existingData.name &&
          newGender == existingData.gender &&
          newPosition == existingData.position &&
          newState == existingData.state &&
          newTown == existingData.town &&
          newEmail == existingData.email &&
          (newProfilePicturePath.isEmpty || newProfilePicturePath == existingData.profilePictureUrl)) {
        Get.snackbar("No Changes", "No updates were made to your profile.");
        return;
      }

      isLoading.value = true;

      final UserModel request = UserModel(
        uid: uid,
        name: newName,
        gender: newGender,
        position: newPosition,
        state: newState,
        town: newTown,
        email: newEmail,
      );

      final List<MultipartBody> multipartBody = [];
      if (newProfilePicturePath.isNotEmpty) {
        multipartBody.add(MultipartBody(
          key: "profilePicture",
          file: profilePicturePath.value,));
      }

      Response response = await profileRepo.updateArchitect(request, multipartBody);

      if (response.statusCode == 200 || response.statusCode == 202) {
        showSuccess(context, "Your profile updated successfully");
        fetchProfile();
      } else {
        showError(context, response.body['message']);
      }
    } catch (err) {
      print("Exception: $err");
      showError(context, "Something Went wrong");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout(BuildContext context)async{
    profileRepo.sharedPreferences.clear();
    Get.offAll(()=>Login());
    showSuccess(context, "We will miss you");
  }

  void pickProfilePicture() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['png', 'jpg', 'jpeg'],
      type: FileType.image,
    );
    if (result != null && result.files.isNotEmpty) {
      PlatformFile platformFile = result.files.first;
      XFile filePath = XFile(platformFile.path!);
      profilePicturePath.value = filePath;
    }
  }

}