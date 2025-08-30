class SetFormFillingPageSettingDTO {
  // 1. Fields corresponding to 'desiredFields' in backend (req.body)
  final String? twoDThreeDVideo;
  final num? floorLimit;
  final num? perFloorCharge;
  final String? floorPlanDesignType;
  final String? threeDFloorPlan;
  final String? threeDElevationDesign;
  final String? threeDElevationFeatures;
  final String? threeDElevationViews;
  final String? interiorDesignType;
  final String? interiorDesignDetails;

  // 2. Metadata (labels) for multi-image fields.
  // These keys MUST match the backend's expected `${field}Metadata`
  final List<String>? interiorSamplesMetadata;
  final List<String>? threeDElevationSamplesMetadata;

  SetFormFillingPageSettingDTO({
    this.twoDThreeDVideo,
    this.floorLimit,
    this.perFloorCharge,
    this.floorPlanDesignType,
    this.threeDFloorPlan,
    this.threeDElevationDesign,
    this.threeDElevationFeatures,
    this.threeDElevationViews,
    this.interiorDesignType,
    this.interiorDesignDetails,
    this.interiorSamplesMetadata,
    this.threeDElevationSamplesMetadata,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    // Add desired fields if not null
    if (twoDThreeDVideo != null) data['twoDThreeDVideo'] = twoDThreeDVideo;
    if (floorLimit != null) data['floorLimit'] = floorLimit;
    if (perFloorCharge != null) data['perFloorCharge'] = perFloorCharge;
    if (floorPlanDesignType != null) data['floorPlanDesignType'] = floorPlanDesignType;
    if (threeDFloorPlan != null) data['threeDFloorPlan'] = threeDFloorPlan;
    if (threeDElevationDesign != null) data['threeDElevationDesign'] = threeDElevationDesign;
    if (threeDElevationFeatures != null) data['threeDElevationFeatures'] = threeDElevationFeatures;
    if (threeDElevationViews != null) data['threeDElevationViews'] = threeDElevationViews;
    if (interiorDesignType != null) data['interiorDesignType'] = interiorDesignType;
    if (interiorDesignDetails != null) data['interiorDesignDetails'] = interiorDesignDetails;

    // Add metadata lists for image fields
    // The _processReportFields in ApiClient will correctly jsonEncode these lists if they are sent as `value is List`
    if (interiorSamplesMetadata != null) data['interiorSamplesMetadata'] = interiorSamplesMetadata;
    if (threeDElevationSamplesMetadata != null) data['threeDElevationSamplesMetadata'] = threeDElevationSamplesMetadata;

    return data;
  }
}