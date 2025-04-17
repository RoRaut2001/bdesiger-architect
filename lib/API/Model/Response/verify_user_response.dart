

import '../../../Model/user_model.dart';

class VerifyUserResponse {
  String? message;
  UserModel? userData;
  String? uid;
  VerifyUserResponse({this.message, this.userData, this.uid});
  VerifyUserResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'] ?? " ";
    userData = json['userData'] != null
        ? new UserModel.fromJson(json['userData'])
        : null;
    uid = json['uid'] ?? " ";
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.userData != null) {
      data['userData'] = this.userData!.toJson();
    }
    data['uid'] = this.uid;
    return data;
  }
}


