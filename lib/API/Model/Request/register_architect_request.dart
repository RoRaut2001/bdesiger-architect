class RegisterArchitectRequest {
  String? uid;
  String? name;
  String? position;
  String? gender;
  String? state;
  String? town;
  List<String>? serviceProvided;
  List<String>? softwareUsed;
  List<AdditionalData>? additionalData;

  RegisterArchitectRequest(
      {
        this.uid,
        this.name,
        this.position,
        this.gender,
        this.state,
        this.town,
        this.serviceProvided,
        this.softwareUsed,
        this.additionalData});

  RegisterArchitectRequest.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    position = json['position'];
    gender = json['gender'];
    state = json['state'];
    town = json['town'];
    serviceProvided = json['serviceProvided'].cast<String>();
    softwareUsed = json['softwareUsed'].cast<String>();
    if (json['additionalData'] != null) {
      additionalData = <AdditionalData>[];
      json['additionalData'].forEach((v) {
        additionalData!.add(new AdditionalData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['position'] = this.position;
    data['gender'] = this.gender;
    data['state'] = this.state;
    data['town'] = this.town;
    data['serviceProvided'] = this.serviceProvided;
    data['softwareUsed'] = this.softwareUsed;
    if (this.additionalData != null) {
      data['additionalData'] =
          this.additionalData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AdditionalData {
  String? question;
  String? answer;

  AdditionalData({this.question, this.answer});

  AdditionalData.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['answer'] = this.answer;
    return data;
  }
}
