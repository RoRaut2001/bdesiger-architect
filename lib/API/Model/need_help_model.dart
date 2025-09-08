class NeedHelpPage {
  List<QuestionAnswer>? onlineConsultant;
  List<QuestionAnswer>? generalQueries;
  List<QuestionAnswer>? designPackage;
  List<QuestionAnswer>? paymentRefund;
  List<QuestionAnswer>? needHelp;

  NeedHelpPage(
      {this.onlineConsultant,
        this.generalQueries,
        this.designPackage,
        this.paymentRefund,
        this.needHelp});

  NeedHelpPage.fromJson(Map<String, dynamic> json) {
    if (json['online_consultant'] != null) {
      onlineConsultant = <QuestionAnswer>[];
      json['online_consultant'].forEach((v) {
        onlineConsultant!.add(new QuestionAnswer.fromJson(v));
      });
    }
    if (json['general_queries'] != null) {
      generalQueries = <QuestionAnswer>[];
      json['general_queries'].forEach((v) {
        generalQueries!.add(new QuestionAnswer.fromJson(v));
      });
    }
    if (json['design_package'] != null) {
      designPackage = <QuestionAnswer>[];
      json['design_package'].forEach((v) {
        designPackage!.add(new QuestionAnswer.fromJson(v));
      });
    }
    if (json['payment_refund'] != null) {
      paymentRefund = <QuestionAnswer>[];
      json['payment_refund'].forEach((v) {
        paymentRefund!.add(new QuestionAnswer.fromJson(v));
      });
    }
    if (json['need_help'] != null) {
      needHelp = <QuestionAnswer>[];
      json['need_help'].forEach((v) {
        needHelp!.add(new QuestionAnswer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.onlineConsultant != null) {
      data['online_consultant'] =
          this.onlineConsultant!.map((v) => v.toJson()).toList();
    }
    if (this.generalQueries != null) {
      data['general_queries'] =
          this.generalQueries!.map((v) => v.toJson()).toList();
    }
    if (this.designPackage != null) {
      data['design_package'] =
          this.designPackage!.map((v) => v.toJson()).toList();
    }
    if (this.paymentRefund != null) {
      data['payment_refund'] =
          this.paymentRefund!.map((v) => v.toJson()).toList();
    }
    if (this.needHelp != null) {
      data['need_help'] = this.needHelp!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuestionAnswer {
  String? title;
  List<Qas>? qas;

  QuestionAnswer({this.title, this.qas});

  QuestionAnswer.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['qas'] != null) {
      qas = <Qas>[];
      json['qas'].forEach((v) {
        qas!.add(new Qas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.qas != null) {
      data['qas'] = this.qas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Qas {
  String? question;
  String? answer;

  Qas({this.question, this.answer});

  Qas.fromJson(Map<String, dynamic> json) {
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