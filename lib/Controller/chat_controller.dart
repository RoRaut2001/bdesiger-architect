import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../Model/report_model.dart';

class ChatController extends GetxController {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  var userId = ''.obs;
  var isLoading = false.obs;

  @override
  void onInit() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    userId.value = sharedPreferences.getString("uid") ?? "";
    super.onInit();
  }

  Future<void> checkChatStatus(BuildContext context,
      ReportModel projectData) async {
    try {
      print(
          "Initializing checkChatStatus for project ID: ${projectData
              .projectId}");

      // Step 1: Retrieve the user ID
      final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      final String userId = sharedPreferences.getString("uid") ?? "";

      if (userId.isEmpty) {
        print("Error: User ID not found in SharedPreferences.");
        return;
      }

      print("Retrieved user ID: $userId");

      // Step 2: Fetch the user document
      final userDoc = await db.collection("users").doc(userId).get();
      if (!userDoc.exists || projectData.architectId != userId) {
        Get.snackbar("Oops!", "Project is not related to you");
        print(
            "Error: User with ID $userId not found in 'users' collection. ${projectData
                .projectId}, ${projectData.createdById}");
        return;
      }
      print("User document found.");

      // Step 3: Fetch the project document
      final projectDoc =
      await db.collection("reports").doc(projectData.projectId).get();
      if (!projectDoc.exists || projectDoc.data() == null) {
        Get.snackbar("Oops!", "Project not found in database");
        print("Error: Project with ID ${projectData.projectId} not found.");
        return;
      }

      final ReportModel project = ReportModel.fromJson(projectDoc.data()!);
      print("Project data retrieved successfully: ${project.toJson()}");

      // Step 4: Check if the project has an assigned architect
      if (project.architectId == null || project.architectId!.isEmpty) {
        print("Project is not assigned to an architect.");
        Get.snackbar("Oops!", "Project is not assigned to an architect yet");
        return;
      }

      print("Project has an architect. Redirecting to ChatScreen...");
      Navigator.pushNamed(context, '/chat', arguments: projectData);

      // Step 5: Check or create chat document
      final chatDoc =
      await db.collection("chats").doc(projectData.projectId).get();

      if (!chatDoc.exists) {
        print(
            "Chat document for project ${projectData
                .projectId} does not exist. Creating one...");
        await db.collection("chats").doc(projectData.projectId).set({
          'users': [userId],
        });
        print("Chat document created and user $userId added.");
      } else {
        print("Chat document found. Checking if user exists...");
        final List<dynamic>? chatUsers =
        chatDoc.data()?['users'] as List<dynamic>?;

        if (chatUsers == null || !chatUsers.contains(userId)) {
          print("User $userId not found in chat. Adding...");
          await db.collection("chats").doc(projectData.projectId).update({
            'users': FieldValue.arrayUnion([userId]),
          });
          print(
              "User $userId added to chat for project ${projectData
                  .projectId}.");
        } else {
          print(
              "User $userId already exists in chat for project ${projectData
                  .projectId}.");
        }
      }
    } catch (e) {
      print("Error checking chat status: $e");
    }
  }

  Stream<List<types.Message>> getMessages(String projectId) {
    return db.collection("chats").doc(projectId).snapshots().map((snapshot) {
      final data = snapshot.data();
      if (data == null || !data.containsKey("messages")) return [];

      final List messages = data["messages"];
      print("Messages: $messages");

      final sortedMessages = messages.map<types.Message>((msg) {
        // Ensure messages have an "author" field
        final authorId = msg["author"]?["id"] ?? msg["authorId"] ??
            "unknown_user";
        final author = types.User(id: authorId);

        if (msg["type"] == "text") {
          return types.TextMessage(
            id: msg["id"],
            author: author,
            createdAt: msg["createdAt"],
            text: msg["text"],
          );
        } else if (msg["type"] == "file") {
          return types.FileMessage(
            id: msg["id"] ?? DateTime
                .now()
                .millisecondsSinceEpoch
                .toString(),
            author: author,
            createdAt: msg["createdAt"] ?? DateTime
                .now()
                .millisecondsSinceEpoch,
            name: msg["name"] ?? "Unknown File",
            size: msg["size"] ?? 0,
            uri: msg["uri"] ?? "",
          );
        } else {
          print("Unknown message type: ${msg["type"]}");
          return types.FileMessage(author: author,
              id: "",
              name: "",
              size: 0,
              uri: "");
        }
      }).toList();

      // Sort messages (newest last)
      sortedMessages.sort((b, a) => a.createdAt!.compareTo(b.createdAt!));

      return sortedMessages;
    });
  }


  Future<void> sendMessage(types.Message message, dynamic report) async {
    final projectId = report?.projectId ?? "";
    if (projectId.isEmpty) return;

    try {
      isLoading(true);
      final messageData = {
        "id": message.id,
        "author": {"id": message.author.id},
        "createdAt": message.createdAt,
        "type": message is types.TextMessage ? "text" : "file",
      };

      if (message is types.TextMessage) {
        messageData["text"] = message.text;
      } else if (message is types.FileMessage) {
        if (message.uri.isEmpty || message.name.isEmpty || message.size == 0) {
          throw Exception("Invalid file message data!");
        }
        messageData.addAll({
          "name": message.name,
          "size": message.size,
          "uri": message.uri,
        });
      }

      await db.collection("chats").doc(projectId).set({
        "messages": FieldValue.arrayUnion([messageData])
      }, SetOptions(merge: true));

    } catch (e) {
      print("Firestore write error: $e");
    }
    finally{
      isLoading(false);
    }
  }


  Future<void> pickFile(dynamic report) async {
    final result = await FilePicker.platform.pickFiles(type: FileType.any);

    if (result != null && result.files.single.path != null) {
      try {
        final file = File(result.files.single.path!);
        final fileName = result.files.single.name;
        final fileSize = result.files.single.size;

        final ref = storage.ref().child("uploads/${DateTime.now()}_$fileName");
        final uploadTask = ref.putFile(file);

        // Run Firebase task on UI thread
        final snapshot = await uploadTask.whenComplete(() => null);
        final downloadUrl = await snapshot.ref.getDownloadURL();

        if (!downloadUrl.startsWith("http")) throw Exception("Invalid download URL");

        final fileMessage = types.FileMessage(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          author: types.User(id: userId.value),
          createdAt: DateTime.now().millisecondsSinceEpoch,
          name: fileName,
          size: fileSize,
          uri: downloadUrl,
        );
        sendMessage(fileMessage, report);
      } catch (e) {
        print("File upload error: $e");
      }
    }
  }



  Future<void> downloadFile(String fileUrl, ReportModel report, String name) async {
    try {
      print("Attempting to download file: $fileUrl");

      if (!fileUrl.startsWith("https")) {
        print("Invalid file URL: $fileUrl");
        return;
      }

      // Ask user to select a directory
      String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

      if (selectedDirectory == null) {
        print("User canceled file selection.");
        return;
      }

      final fileName = "BDesigner submission for ${report.commonData!.totalBuildupArea.toString()} Sq.ft plan ${name}"; // Extract file name
      final savePath = "$selectedDirectory/$fileName";

      Dio dio = Dio();
      await dio.download(fileUrl, savePath);
      print("File downloaded successfully: $savePath");
    } catch (e) {
      print("Download error: $e");
    }
  }
}