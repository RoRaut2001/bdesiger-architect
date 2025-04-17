import 'package:b_designer_architecture/Controller/chat_controller.dart';
import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:b_designer_architecture/View/Screens/project_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import '../../../Model/report_model.dart';

class ChatWeb extends StatelessWidget {
  ChatWeb({super.key});

  final ChatController chatController = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    final report = ModalRoute.of(context)?.settings.arguments as ReportModel?;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              child: ProjectDetails(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border(left: BorderSide(color: Colors.black)),
              ),
              child: StreamBuilder<List<types.Message>>(
                stream: chatController.getMessages(report?.projectId ?? ""),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text("Error loading messages"));
                  }

                  final messages = snapshot.data ?? [];

                  return Obx(()=>chatController.isLoading.value ? showLoading() : Chat(
                    theme: DefaultChatTheme(
                      messageBorderRadius: 10,
                      primaryColor: Colors.black,
                      secondaryColor: Colors.grey,
                    ),
                    fileMessageBuilder: (message, {required messageWidth}) {
                      bool isImage = message.name.toLowerCase().endsWith('.png') ||
                          message.name.toLowerCase().endsWith('.jpg') ||
                          message.name.toLowerCase().endsWith('.jpeg') ||
                          message.name.toLowerCase().endsWith('.gif') ||
                          message.name.toLowerCase().endsWith('.bmp') ||
                          message.name.toLowerCase().endsWith('.webp');
                      return Container(
                        constraints: BoxConstraints(
                          maxWidth: 30.w,
                          maxHeight: 20.h
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.black
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if(isImage) SizedBox(
                              width: messageWidth.toDouble(),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                clipBehavior: Clip.hardEdge,
                                child: Image.network(message.uri, fit: BoxFit.scaleDown, height: 10.h,),
                              ),
                            ),
                            ListTile(
                              title: Text(message.name, style: TextStyle(
                                fontSize: 0.8.t,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                              ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              leading: CircleAvatar(
                                backgroundColor: Colors.grey,
                                child: Icon(Icons.file_present_rounded, color: Colors.black,),
                              ),
                              trailing: Icon(Icons.file_download_outlined, color: Colors.white,),
                              contentPadding: EdgeInsets.all(0),
                            )
                          ],
                        ),
                      );
                    },
                    messages: messages,
                    onSendPressed: (partialText) {
                      if (report == null) return;
                      final textMessage = types.TextMessage(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        author: types.User(id: chatController.userId.value),
                        createdAt: DateTime.now().millisecondsSinceEpoch,
                        text: partialText.text,
                      );
                      chatController.sendMessage(textMessage, report);
                    },
                    onAttachmentPressed: () async {
                      if (report != null) {
                        await chatController.pickFile(report);
                      }
                    },
                    onMessageTap: (context, message) {
                      if (message is types.FileMessage) {
                        print("Message JSON: ${message.toJson()}");
                        print("File url is : ${message.uri}");
                        chatController.downloadFile(message.uri, report!, message.name);
                      }
                    },
                    user: types.User(id: chatController.userId.value),
                  ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget showLoading(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          strokeCap: StrokeCap.round,
          color: Colors.black,
        ),
        SizedBox(
          height: 10,
        ),
        Text("Sending Message...")
      ],
    );
  }
}
