class Rating {
  double? rating;
  String? review;
  String? projectId;
  String? createdDate;
  String? createdTime;
  String? deletedDate;
  String? deletedTime;
  String? updatedDate;
  String? updatedTime;

  Rating(
      {this.rating,
        this.review,
        this.projectId,
        this.createdDate,
        this.createdTime,
        this.deletedDate,
        this.deletedTime,
        this.updatedDate,
        this.updatedTime});

  Rating.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    review = json['review'];
    projectId = json['projectId'];
    createdDate = json['createdDate'];
    createdTime = json['createdTime'];
    deletedDate = json['deletedDate'];
    deletedTime = json['deletedTime'];
    updatedDate = json['updatedDate'];
    updatedTime = json['updatedTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating'] = this.rating;
    data['review'] = this.review;
    data['projectId'] = this.projectId;
    data['createdDate'] = this.createdDate;
    data['createdTime'] = this.createdTime;
    data['deletedDate'] = this.deletedDate;
    data['deletedTime'] = this.deletedTime;
    data['updatedDate'] = this.updatedDate;
    data['updatedTime'] = this.updatedTime;
    return data;
  }
}

class Projects {
  int? total;
  int? pending;
  int? completed;

  Projects({this.total, this.pending, this.completed});

  Projects.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    pending = json['pending'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['pending'] = this.pending;
    data['completed'] = this.completed;
    return data;
  }
}
