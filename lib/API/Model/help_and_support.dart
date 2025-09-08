import 'need_help_model.dart';

class ArchitectSetting {
  NeedHelpPage? needHelpPage;

  ArchitectSetting({this.needHelpPage});

  ArchitectSetting.fromJson(Map<String, dynamic> json) {
    needHelpPage = json['needHelpPage'] != null
        ? NeedHelpPage.fromJson(json['needHelpPage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (needHelpPage != null) {
      data['needHelpPage'] = needHelpPage!.toJson();
    }
    return data;
  }
}
