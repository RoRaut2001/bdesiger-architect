class SetReportPageSettingDTO {
  String? agreementForClient;

  SetReportPageSettingDTO({this.agreementForClient});

  SetReportPageSettingDTO.fromJson(Map<String, dynamic> json) {
    agreementForClient = json['agreementForClient'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agreementForClient'] = this.agreementForClient;
    return data;
  }
}
