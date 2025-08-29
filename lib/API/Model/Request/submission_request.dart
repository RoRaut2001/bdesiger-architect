class SubmissionRequest {
  String? projectId;
  int? remainingRevision;

  SubmissionRequest({this.projectId, this.remainingRevision});

  SubmissionRequest.fromJson(Map<String, dynamic> json) {
    projectId = json['projectId'];
    remainingRevision = json['remainingRevision'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['projectId'] = this.projectId;
    data['remainingRevision'] = this.remainingRevision;
    return data;
  }
}
