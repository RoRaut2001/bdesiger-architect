class SetLoginPageSettingDTO {
  String? introVideo;

  SetLoginPageSettingDTO({this.introVideo});

  SetLoginPageSettingDTO.fromJson(Map<String, dynamic> json) {
    introVideo = json['introVideo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['introVideo'] = this.introVideo;
    return data;
  }
}
