class HomePageSettingDTO {
  List<ProjectReviewVideo>? projectReviewVideo;
  List<CivilEngineerContact>? civilEngineerContact;
  List<String>? bannerMetaData;

  HomePageSettingDTO(
      {this.bannerMetaData, this.projectReviewVideo, this.civilEngineerContact});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (bannerMetaData != null) data['bannerMetaData'] = bannerMetaData;
    if (this.projectReviewVideo != null) {
      data['projectReviewVideo'] =
          this.projectReviewVideo!.map((v) => v.toJson()).toList();
    }
    if (this.civilEngineerContact != null) {
      data['civilEngineerContact'] =
          this.civilEngineerContact!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProjectReviewVideo {
  String? title;
  String? link;

  ProjectReviewVideo({this.title, this.link});

  ProjectReviewVideo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['link'] = this.link;
    return data;
  }
}

class CivilEngineerContact {
  String? name;
  String? address;
  int? completedProjects;
  String? website;
  String? phoneNumber;
  String? comment;

  CivilEngineerContact(
      {this.name,
        this.address,
        this.completedProjects,
        this.website,
        this.phoneNumber,
        this.comment});

  CivilEngineerContact.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    completedProjects = int.tryParse(json['completedProjects'] ?? json['projects']) ?? 0;
    website = json['website'];
    phoneNumber = json['phone_number'] ?? json['mobile'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['completedProjects'] = this.completedProjects;
    data['website'] = this.website;
    data['phone_number'] = this.phoneNumber;
    data['comment'] = this.comment;
    return data;
  }
}
