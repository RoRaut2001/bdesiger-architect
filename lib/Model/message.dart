import 'package:cloud_firestore/cloud_firestore.dart';

enum MessageType { Text, Image, File }

class Message {
  String? senderID;
  String? content;
  String? fileName;
  MessageType? messageType;
  Timestamp? sentAt;

  Message({
    required this.senderID,
    required this.content,
    this.fileName,
    required this.messageType,
    required this.sentAt,
  });

  Message.fromJson(Map<String, dynamic> json) {
    senderID = json['senderID'];
    fileName = json['fileName'];
    content = json['content'];
    sentAt = json['sentAt'];
    messageType = MessageType.values.byName(json['messageType']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['senderID'] = senderID;
    data['fileName'] = fileName;
    data['content'] = content;
    data['sentAt'] = sentAt;
    data['messageType'] = messageType!.name;
    return data;
  }
}