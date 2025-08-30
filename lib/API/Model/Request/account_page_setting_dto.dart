class AccountPageSettingDTO {
  String? termsAndCondition;
  String? privacyPolicy;

  AccountPageSettingDTO({this.termsAndCondition, this.privacyPolicy});

  AccountPageSettingDTO.fromJson(Map<String, dynamic> json) {
    termsAndCondition = json['termsAndCondition'];
    privacyPolicy = json['privacyPolicy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['termsAndCondition'] = this.termsAndCondition;
    data['privacyPolicy'] = this.privacyPolicy;
    return data;
  }
}
