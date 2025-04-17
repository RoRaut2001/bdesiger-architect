class UserModel {
  String? uid;
  String? token;
  String? name;
  String? gender;
  String? position;
  String? state;
  String? town;
  String? userType;
  String? role;
  String? language;
  String? addDate;
  String? addTime;
  String? flag;
  String? deletedDate;
  String? deletedTime;
  String? profilePictureUrl;
  String? comapanyLogoUrl;
  String? phoneNumber;
  String? updateDate;
  String? companyName;
  String? location;
  String? updateTime;
  String? email;

  UserModel(
      {this.uid,
        this.token,
        this.name,
        this.gender,
        this.userType,
        this.role,
        this.state,
        this.town,
        this.position,
        this.language,
        this.addDate,
        this.addTime,
        this.flag,
        this.deletedDate,
        this.deletedTime,
        this.profilePictureUrl,
        this.comapanyLogoUrl,
        this.phoneNumber,
        this.updateDate,
        this.companyName,
        this.location,
        this.updateTime,
        this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    token = json['token'];
    name = json['name'];
    gender = json['gender'];
    userType = json['userType'];
    role = json['role'];
    state = json['state'];
    town = json['town'];
    position = json['position'];
    language = json['language'];
    addDate = json['addDate'];
    addTime = json['addTime'];
    flag = json['flag'];
    deletedDate = json['deletedDate'];
    deletedTime = json['deletedTime'];
    profilePictureUrl = json['profilePictureUrl'];
    comapanyLogoUrl = json['comapanyLogoUrl'];
    phoneNumber = json['phoneNumber'];
    updateDate = json['updateDate'];
    companyName = json['companyName'];
    location = json['location'];
    updateTime = json['updateTime'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['token'] = this.token;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['userType'] = this.userType;
    data['role'] = this.role;
    data['state'] = this.state;
    data['town'] = this.town;
    data['position'] = this.position;
    data['language'] = this.language;
    data['addDate'] = this.addDate;
    data['addTime'] = this.addTime;
    data['flag'] = this.flag;
    data['deletedDate'] = this.deletedDate;
    data['deletedTime'] = this.deletedTime;
    data['profilePictureUrl'] = this.profilePictureUrl;
    data['comapanyLogoUrl'] = this.comapanyLogoUrl;
    data['phoneNumber'] = this.phoneNumber;
    data['updateDate'] = this.updateDate;
    data['companyName'] = this.companyName;
    data['location'] = this.location;
    data['updateTime'] = this.updateTime;
    data['email'] = this.email;
    return data;
  }
}

