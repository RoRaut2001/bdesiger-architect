class VideoPageSettingDTO {
  List<VideoPageContent>? content;

  VideoPageSettingDTO({this.content});

  VideoPageSettingDTO.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      content = <VideoPageContent>[];
      json['data'].forEach((v) {
        content!.add(new VideoPageContent.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['data'] = this.content!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VideoPageContent {
  String? title;
  String? link;

  VideoPageContent({this.title, this.link});

  VideoPageContent.fromJson(Map<String, dynamic> json) {
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