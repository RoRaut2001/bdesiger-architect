
class ReportModel {
  final String? projectId;
  final String? createdById;
  final FloorPlan? floorPlan;
  final CommonData? commonData;
  final ThreeDPlan? threeDPlan;
  final InteriorPlan? interiorPlan;
  final String? paymentStatus;
  final String? status;
  final String? consultant;
  final String? architectId;
  final String? createdTime;
  final String? createdDate;
  final String? updatedTime;
  final String? updatedDate;
  final String? deletedDate;
  final String? deletedTime;
  final String? createdBy;
  final String? flag;
  final String? totalAmount;

  ReportModel({
    this.projectId,
    this.createdById,
    this.totalAmount,
    required this.floorPlan,
    required this.commonData,
    this.threeDPlan,
    this.interiorPlan,
    required this.paymentStatus,
    required this.status,
    this.consultant,
    this.architectId,
    required this.createdTime,
    required this.createdDate,
    this.updatedTime,
    this.updatedDate,
    this.deletedDate,
    this.deletedTime,
    required this.createdBy,
    required this.flag,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      projectId: json['projectId'],
      createdById: json['createdById'],
      totalAmount: json['totalAmount'] ?? '',
      floorPlan: json['floorPlan'] != null
          ? FloorPlan.fromJson(json['floorPlan'])
          : null,
      commonData: json['commonData'] != null
          ? CommonData.fromJson(json['commonData'])
          : null,
      threeDPlan: json['threeDPlan'] != null
          ? ThreeDPlan.fromJson(json['threeDPlan'])
          : null,
      interiorPlan: json['interiorPlan'] != null
          ? InteriorPlan.fromJson(json['interiorPlan'])
          : null,
      paymentStatus: json['paymentStatus'] ?? '',
      status: json['status'] ?? '',
      consultant: json['consultant'] ?? '',
      architectId: json['architectId'] ?? '',
      createdTime: json['createdTime'] ?? '',
      createdDate: json['createdDate'] ?? '',
      updatedTime: json['updatedTime'] ?? '',
      updatedDate: json['updatedDate'] ?? '',
      deletedDate: json['deletedDate'] ?? '',
      deletedTime: json['deletedTime'] ?? '',
      createdBy: json['createdBy'] ?? '',
      flag: json['flag'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'projectId': projectId,  // Adding the projectId to JSON
      'createdById': createdById,  // Adding the projectId to JSON
      'floorPlan': floorPlan?.toJson(),
      'commonData': commonData?.toJson(),
      'threeDPlan': threeDPlan,
      'interiorPlan': interiorPlan,
      'paymentStatus': paymentStatus,
      'status': status,
      'consultant': consultant,
      'architectId': architectId,
      'createdTime': createdTime,
      'createdDate': createdDate,
      'updatedTime': updatedTime,
      'updatedDate': updatedDate,
      'deletedDate': deletedDate,
      'deletedTime': deletedTime,
      'createdBy': createdBy,
      'flag': flag,
      'totalAmount': totalAmount
    };
  }
}

class CommonData {
  String? architectId;
  String? consultant;
  String? createdBy;
  List<String>? selectedServices;
  RectangleModel? plotArea;
  RectangleModel? builtupArea;
  int? totalBuildupArea;
  int? floorCount;
  String? location;
  int? familyMemberCount;
  String? isVastuStandard;
  String? homeFrontFacing;
  int? bike;
  int? cars;
  int? suv;
  int? totalAmount;

  CommonData({
    this.architectId,
    this.consultant,
    this.createdBy,
    this.selectedServices,
    this.plotArea,
    this.builtupArea,
    this.totalBuildupArea,
    this.floorCount,
    this.location,
    this.familyMemberCount,
    this.isVastuStandard,
    this.homeFrontFacing,
    this.bike,
    this.cars,
    this.suv,
    this.totalAmount,
  });

  CommonData.fromJson(Map<String, dynamic> json) {
    architectId = json['architectId'] as String?;
    consultant = json['consultant'] as String?;
    createdBy = json['createdBy'] as String?;
    selectedServices = (json['selectedServices'] as List<dynamic>?)
        ?.map((e) => e.toString())
        .toList();
    plotArea = json['plotArea'] != null
        ? RectangleModel.fromJson(json['plotArea'])
        : null;
    builtupArea = json['builtupArea'] != null
        ? RectangleModel.fromJson(json['builtupArea'])
        : null;
    totalBuildupArea = json['totalBuildupArea'] as int?;
    floorCount = json['floorCount'] as int?;
    location = json['location'] as String?;
    familyMemberCount = json['familyMemberCount'] as int?;
    isVastuStandard = json['isVastuStandard'] as String?;
    homeFrontFacing = json['homeFrontFacing'] as String?;
    bike = json['bike'] as int?;
    cars = json['cars'] as int?;
    suv = json['suv'] as int?;
    totalAmount = json['totalAmount'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['architectId'] = architectId;
    data['consultant'] = consultant;
    data['createdBy'] = createdBy;
    data['selectedServices'] = selectedServices;
    if (plotArea != null) data['plotArea'] = plotArea!.toJson();
    if (builtupArea != null) data['builtupArea'] = builtupArea!.toJson();
    data['totalBuildupArea'] = totalBuildupArea;
    data['floorCount'] = floorCount;
    data['location'] = location;
    data['familyMemberCount'] = familyMemberCount;
    data['isVastuStandard'] = isVastuStandard;
    data['homeFrontFacing'] = homeFrontFacing;
    data['bike'] = bike;
    data['cars'] = cars;
    data['suv'] = suv;
    data['totalAmount'] = totalAmount;
    return data;
  }
}

class FloorPlan {
  String? elevationType;
  List<String>? floorPlanType;
  RectangleModel? sideMargin;
  RectangleModel? sideDetails;
  Map<String, dynamic>? floorData;
  int? floorPlanAmount;

  FloorPlan({
    this.elevationType,
    this.floorPlanType,
    this.sideMargin,
    this.sideDetails,
    this.floorData,
    this.floorPlanAmount,
  });

  FloorPlan.fromJson(Map<String, dynamic> json) {
    elevationType = json['elevationType'] as String?;
    floorPlanType = (json['floorPlanType'] as List<dynamic>?)
        ?.map((e) => e.toString())
        .toList();
    sideMargin = json['sideMargin'] != null
        ? RectangleModel.fromJson(json['sideMargin'])
        : null;
    sideDetails = json['sideDetails'] != null
        ? RectangleModel.fromJson(json['sideDetails'])
        : null;
    floorData = json['floorData'] as Map<String, dynamic>?;
    floorPlanAmount = json['floorPlanAmount'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['elevationType'] = elevationType;
    data['floorPlanType'] = floorPlanType;
    if (sideMargin != null) data['sideMargin'] = sideMargin!.toJson();
    if (sideDetails != null) data['sideDetails'] = sideDetails!.toJson();
    data['floorData'] = floorData;
    data['floorPlanAmount'] = floorPlanAmount;
    return data;
  }
}

// Similarly refactor ThreeDPlan and InteriorPlan.
class ThreeDPlan {
  List<String>? elevationType;
  String? budget;
  List<String>? feature;
  List<String>? views;
  int? threeDPlanAmount;

  ThreeDPlan({
    this.elevationType,
    this.budget,
    this.feature,
    this.views,
    this.threeDPlanAmount,
  });

  ThreeDPlan.fromJson(Map<String, dynamic> json) {
    elevationType = (json['elevationType'] as List<dynamic>?)?.map((e)=> e.toString()).toList();
    budget = json['budget'] as String?;
    feature = (json['feature'] as List<dynamic>?)
        ?.map((e) => e.toString())
        .toList();
    views = (json['views'] as List<dynamic>?)
        ?.map((e) => e.toString())
        .toList();
    threeDPlanAmount = json['threeDPlanAmount'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['elevationType'] = elevationType;
    data['budget'] = budget;
    data['feature'] = feature;
    data['views'] = views;
    data['threeDPlanAmount'] = threeDPlanAmount;
    return data;
  }
}

class InteriorPlan {
  String? serviceType;
  RectangleModel? carpetArea;
  int? totalCarpetArea;
  String? interiorDesignType;
  List<String>? designDetails;
  String? budget;
  int? interiorAmount;

  InteriorPlan({
    this.serviceType,
    this.carpetArea,
    this.totalCarpetArea,
    this.interiorDesignType,
    this.designDetails,
    this.budget,
    this.interiorAmount,
  });

  InteriorPlan.fromJson(Map<String, dynamic> json) {
    serviceType = json['serviceType'] as String?;
    carpetArea = json['carpetArea'] != null
        ? RectangleModel.fromJson(json['carpetArea'])
        : null;
    totalCarpetArea = json['totalCarpetArea'] as int?;
    interiorDesignType = json['interiorDesignType'] as String?;
    designDetails = (json['designDetails'] as List<dynamic>?)
        ?.map((e) => e.toString())
        .toList();
    budget = json['budget'] as String?;
    interiorAmount = json['interiorAmount'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['serviceType'] = serviceType;
    if (carpetArea != null) data['carpetArea'] = carpetArea!.toJson();
    data['totalCarpetArea'] = totalCarpetArea;
    data['interiorDesignType'] = interiorDesignType;
    data['designDetails'] = designDetails;
    data['budget'] = budget;
    data['interiorAmount'] = interiorAmount;
    return data;
  }
}

class RectangleModel {
  String? leftSide;
  String? rightSide;
  String? backSide;
  String? frontSide;

  RectangleModel({
    this.leftSide,
    this.rightSide,
    this.backSide,
    this.frontSide,
  });

  factory RectangleModel.fromJson(Map<String, dynamic> json) {
    return RectangleModel(
      leftSide: json['leftSide'],
      rightSide: json['rightSide'],
      backSide: json['backSide'],
      frontSide: json['frontSide'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'leftSide': leftSide,
      'rightSide': rightSide,
      'backSide': backSide,
      'frontSide': frontSide,
    };
  }
}
