class Submission {
  List<String>? threeDFloorPlan;
  List<String>? elevationPlan;
  List<String>? twoDFloorPlan;
  List<String>? sectionElevationPlan;
  List<String>? elevation;
  List<String>? arModel;
  List<String>? elevationImage;
  List<String>? vrModel;
  List<String>? interiorVr;
  List<String>? interiorAr;
  List<String>? elevationDimensions;
  List<String>? interiorImage;
  List<String>? structuralDesign;
  List<String>? electricalDrawings;
  List<String>? plumbingDesign;
  List<String>? document;

  Submission(
      {this.threeDFloorPlan,
        this.elevationPlan,
        this.twoDFloorPlan,
        this.sectionElevationPlan, /* COMMENT: Added sectionElevationPlan to constructor */
        this.elevation,
        this.arModel,
        this.elevationImage,
        this.vrModel,
        this.interiorVr,
        this.interiorAr,
        this.elevationDimensions,
        this.interiorImage,
        this.structuralDesign,
        this.electricalDrawings,
        this.plumbingDesign,
        this.document});

  Submission.fromJson(Map<String, dynamic> json) {
    /**** COMMENT: Safely cast to List<String> or assign null if key is missing or not a List ****/
    threeDFloorPlan = _tryCastList(json['three_d_floor_plan']);
    elevationPlan = _tryCastList(json['elevation_plan']);
    twoDFloorPlan = _tryCastList(json['two_d_floor_plan']);
    sectionElevationPlan = _tryCastList(json['section_elevation_plan']); /* COMMENT: Handles section_elevation_plan if it appears */
    elevation = _tryCastList(json['elevation']);
    arModel = _tryCastList(json['ar_model']);
    elevationImage = _tryCastList(json['elevation_image']);
    vrModel = _tryCastList(json['vr_model']);
    interiorVr = _tryCastList(json['interior_vr']);
    interiorAr = _tryCastList(json['interior_ar']);
    elevationDimensions = _tryCastList(json['elevation_dimensions']);
    interiorImage = _tryCastList(json['interior_image']);
    structuralDesign = _tryCastList(json['structural_design']);
    electricalDrawings = _tryCastList(json['electrical_drawings']);
    plumbingDesign = _tryCastList(json['plumbing_design']);
    document = _tryCastList(json['document']);
  }

  /**** COMMENT: Helper method to safely cast dynamic values to List<String> ****/
  List<String>? _tryCastList(dynamic value) {
    if (value is List) {
      return value.whereType<String>().toList();
    }
    return null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{}; /* COMMENT: Using map literal for initialization */
    data['three_d_floor_plan'] = threeDFloorPlan;
    data['elevation_plan'] = elevationPlan;
    data['two_d_floor_plan'] = twoDFloorPlan;
    data['section_elevation_plan'] = sectionElevationPlan; /* COMMENT: Added sectionElevationPlan to toJson */
    data['elevation'] = elevation;
    data['ar_model'] = arModel;
    data['elevation_image'] = elevationImage;
    data['vr_model'] = vrModel;
    data['interior_vr'] = interiorVr;
    data['interior_ar'] = interiorAr;
    data['elevation_dimensions'] = elevationDimensions;
    data['interior_image'] = interiorImage;
    data['structural_design'] = structuralDesign;
    data['electrical_drawings'] = electricalDrawings;
    data['plumbing_design'] = plumbingDesign;
    data['document'] = document;
    return data;
  }
}