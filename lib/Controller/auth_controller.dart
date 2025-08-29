import 'dart:convert';
import 'dart:developer';
import 'package:b_designer_architecture/API/Model/Request/register_architect_request.dart';
import 'package:b_designer_architecture/API/api_client.dart';
import 'package:b_designer_architecture/Constants/app_constant.dart';
import 'package:b_designer_architecture/Helper/toast_messages.dart';
import 'package:b_designer_architecture/Model/rating.dart';
import 'package:b_designer_architecture/Model/user_model.dart';
import 'package:b_designer_architecture/View/Auth/Forms/additional_info.dart';
import 'package:b_designer_architecture/View/Auth/Forms/documents.dart';
import 'package:b_designer_architecture/View/Auth/Forms/services.dart';
import 'package:b_designer_architecture/View/Auth/Forms/softwares.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import '../API/Model/Request/verify_user_request.dart';
import '../API/Model/Response/verify_user_response.dart';
import '../API/Repository/auth_repository.dart';
import '../View/Auth/Forms/basic_details.dart';
import 'package:timer_count_down/timer_controller.dart';

class AuthController extends GetxController {
  final AuthRepository authRepo;

  AuthController({required this.authRepo});

  /* Initialization of controllers */

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController villageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final CountdownController countDownController = CountdownController();

  /* String variable Declarations */

  RxString electricianWork = ''.obs;
  RxString workMachine = ''.obs;
  Rx<XFile> cvFilePath = XFile("").obs;
  Rx<XFile> portfolioFilePath = XFile("").obs;
  Rx<XFile> certificateFilePath = XFile("").obs;
  Rx<XFile> profilePicturePath = XFile("").obs;
  RxString approval = 'Rejected'.obs;
  RxString selectedCode = '+91'.obs;
  var request = 'Pending'.obs;
  var position = ''.obs;
  var gender = 'Male'.obs;
  var pageIndex = 0.obs;
  var isLoading = false.obs;
  var buttonMessage = "Get OTP".obs;
  var otpSent = false.obs;
  var passwordScreen = false.obs;
  var timerFinished = true.obs;
  var verificationCode = ''.obs;
  var otp = ''.obs;
  var userData = UserModel().obs;
  var projectsData = Projects().obs;
  var userId = ''.obs;
  var userFirstName = ''.obs;
  var myRatings = <Rating>[].obs;
  var averageRating = 0.0.obs;

  /* List Variable Declaration */

  var forms = <Widget>[].obs;
  var filesList = <PlatformFile>[].obs;
  var selectedServices = <String>[].obs;
  var selectedSoftwares = <String>[].obs;

  void pickProfilePicture() async {
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

  void pickFile(String fileType) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['pdf', 'docx', 'png', 'jpg', 'jpeg'],
      type: FileType.custom,
    );

    if (result != null && result.files.isNotEmpty) {
      // Get the first file
      PlatformFile platformFile = result.files.first;

      XFile filePath = XFile(platformFile.path!);

      switch (fileType) {
        case "CV":
          cvFilePath.value = filePath;
          break;
        case "Portfolio":
          portfolioFilePath.value = filePath;
          break;
        case "Certificate":
          certificateFilePath.value = filePath;
          break;
        default:
          break;
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    forms.value = [
    ];
  }

  Future<void> login(BuildContext context) async {
    try {
      if (emailController.text.isEmpty) {
        showError(context, "Email is mandatory");
      } else if (passwordController.text.isEmpty) {
        showError(context, "Password is mandatory");
      } else {
        final String email = emailController.text.trim();
        final String password = passwordController.text.trim();
        final response = await authRepo.login(email, password);

        if (response.statusCode == 200) {
          final user = response.body["userData"];

          showSuccess(context, "Login Successful");

          await authRepo.sharedPreferences.setString("uid", user["uid"] ?? "");
          await authRepo.sharedPreferences.setString("firstname", user["name"] ?? "");
          await authRepo.sharedPreferences.setString("token", user["token"] ?? "");

          authRepo.apiClient.updateHeader(user["token"], user["uid"]);

          Navigator.pushReplacementNamed(context, '/dashboard');
        } else {
          showError(context, response.body["message"] ?? "Login failed");
        }
      }
    } catch (err) {
      print("Exception: $err");
      showError(context, "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> verifyUser(String uid, BuildContext context) async {
    try {
      isLoading.value = true;
      Response response = await authRepo.verifyUser(VerifyUserRequest(uid: uid));
      if (response.statusCode == 200 || response.statusCode == 201) {
        otpSent(false);
        clearFields();
        Map<String, dynamic> responseBody;

        try {
          if (response.body is String) {
            responseBody = jsonDecode(response.body) as Map<String, dynamic>;
          } else if (response.body is Map<String, dynamic>) {
            responseBody = response.body as Map<String, dynamic>;
          } else {
            throw Exception("Unexpected Response Body Type: ${response.body.runtimeType}");
          }
        } catch (e) {
          log("JSON Parsing Error: $e");
          isLoading(false);
          return;
        }

        try {
          VerifyUserResponse verifyResponse = VerifyUserResponse.fromJson(responseBody);
          print("Token: ${responseBody['token']}");

          if (verifyResponse.message == "Already registered" && verifyResponse.userData!.role == "Architect") {
            userData.value = verifyResponse.userData!;
            authRepo.sharedPreferences.setString("firstName", verifyResponse.userData!.name!);
            authRepo.sharedPreferences.setString("token", verifyResponse.userData!.token!);
            authRepo.apiClient.updateHeader(verifyResponse.userData!.token ?? "", verifyResponse.uid ?? "");
            Navigator.pushReplacementNamed(context, '/dashboard');
          } else if (verifyResponse.uid != null) {
            userId.value = uid;
            Navigator.pushNamed(context, '/signup');
          } else {
            log("Error: Missing `uid` in response.");
          }
        } catch (err) {
          log("Error Parsing VerifyUserResponse: $err");
        }
      } else {
        log("Error: ${response.statusText}, Status Code: ${response.statusCode}");
      }
    } catch (err) {
      log("API Call Error: $err");
    } finally {
      isLoading(false);
    }
  }

  Future<void> registerArchitect(BuildContext context) async {
    isLoading.value = true;
    try {
      final RegisterArchitectRequest request = RegisterArchitectRequest(
        uid: userId.value,
        name: nameController.text.trim(),
        gender: gender.value,
        position: position.value,
        serviceProvided: selectedServices.toList(),
        softwareUsed: selectedSoftwares.toList(),
        state: stateController.text.trim(),
        town: villageController.text.trim(),
      );

      List<MultipartBody> multipartBody = [
        if (cvFilePath.value.path.isNotEmpty)
          MultipartBody(
            key: "cv",
            file: cvFilePath.value,
          ),
        if (certificateFilePath.value.path.isNotEmpty)
          MultipartBody(
            key: "certificate",
            file: certificateFilePath.value,
          ),
        if (portfolioFilePath.value.path.isNotEmpty)
          MultipartBody(
            key: "portfolio",
            file: portfolioFilePath.value,
          ),
      ];


      Response response = await authRepo.registerArchitect(request, multipartBody);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar("Yeah!", "Registration successful");
        final String uid = response.body['uid'];
        final String token = response.body['token'];
        await authRepo.sharedPreferences.setString("uid", uid);
        await authRepo.sharedPreferences.setString("token", token);
        authRepo.apiClient.updateHeader(token, uid);
        Navigator.pushNamedAndRemoveUntil(
            context, '/dashboard', (Route<dynamic> route) => false);
      } else {
        Get.snackbar("Oops!", response.body['error']?.first['message'] ?? "Error occurred");
      }
    } catch (err) {
      print("Exception: $err");
      Get.snackbar("Oops!", "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await authRepo.sharedPreferences.clear();
    Navigator.pushReplacementNamed(Get.context!, '/');
  }

  Future<void> fetchProfile() async {
    try {
      final String uid =
          await authRepo.sharedPreferences.getString("uid") ?? "";
      if (uid.isEmpty) {
        Get.snackbar("Error", "No UID found");
      } else {
        Response response = await authRepo.fetchProfile();
        if (response.statusCode == 200) {
          userData.value = UserModel.fromJson(response.body);
          assignValues(userData.value);
        } else {
          Get.snackbar("Oops!", response.body['message']);
        }
      }
    } catch (err) {
      print("Exception: $err");
    } finally {
      isLoading(false);
    }
  }

  Future<void> getMyRatings() async {
    try {
      isLoading(true);
      Response response = await authRepo.getMyRatings();
      if (response.statusCode == 200) {
        final data = response.body;

        // Check if the response contains ratings
        if (data != null && data['ratings'] != null) {
          // Parse ratings into a list of Rating objects
          var ratings = (data['ratings'] as List)
              .map((rating) => Rating.fromJson(rating as Map<String, dynamic>))
              .toList();
          projectsData.value = Projects.fromJson(data['projects']);
          print(projectsData.toJson());
          myRatings.assignAll(ratings);
          var totalRating = 0.0;
          myRatings.forEach((rating) {
            totalRating += rating.rating ?? 0;
          });
          averageRating.value = (totalRating / myRatings.length);
        } else {
          Get.snackbar("No Data", "No ratings found.");
        }
      } else {
        Get.snackbar("Oops!", response.body['message'] ?? "An error occurred.");
      }
    } catch (err) {
      print("Exception: $err");
      Get.snackbar("Error", "Failed to fetch ratings.");
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateArchitect(String uid) async {
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
          (newProfilePicturePath.isEmpty ||
              newProfilePicturePath == existingData.profilePictureUrl)) {
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
        multipartBody
            .assign(MultipartBody(
          key: "profilePicture",
          file: profilePicturePath.value,));
      }

      Response response =
          await authRepo.updateArchitect(request, multipartBody);

      if (response.statusCode == 200 || response.statusCode == 202) {
        Get.snackbar("Success", "Your profile updated successfully");
        fetchProfile();
      } else {
        Get.snackbar("Oops!", response.body['message']);
      }
    } catch (err) {
      print("Exception: $err");
      Get.snackbar("Oops!", "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> launchWhatsApp() async {
    final String url = 'https://wa.me/919209914810';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  void assignValues(UserModel user) {
    nameController.text = user.name ?? "";
    emailController.text = user.email ?? '';
    stateController.text = user.state ?? '';
    villageController.text = user.town ?? '';
    gender.value = user.gender?? '';
    position.value = user.position?? '';
  }

  void clearFields() {
    phoneController.clear();
    selectedCode.value = "+91";
    otp.value = "";
    emailController.clear();
    villageController.clear();
    portfolioFilePath.value = XFile("");
    cvFilePath.value = XFile("");
    certificateFilePath.value = XFile("");
  }
}
