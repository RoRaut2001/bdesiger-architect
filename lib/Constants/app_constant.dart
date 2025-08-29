// final String baseurl = "https://b-designer-api.vercel.app/";
// final String baseurl = "http://192.168.1.39:3000/";
final String baseurl = "https://api.bdesigner.instagrp.in/";
// final String baseurl = "http://localhost:3000/";

/**** Shared preferences strings ****/
final String token = "token";
final String uid = "uid";

/**** Auth Urls ****/

final String verifyUserUrl = "auth/verify-user";
final String sendOtpUrl = "auth/send-otp";
final String verifyOtpUrl = "auth/verify-otp";
final String loginUrl = "architect/auth/login";
final String registerUrl = "architect/auth/register";
final String updateUrl = "architect/auth/update";
final String fetchProfileUrl = "architect/auth/get-by-id";


/**** Report URLs ****/

final String fetchReportUrl = "architect/report/fetch-reports";
final String requestProjectUrl = "architect/report/request-project";



/**** Rating URLs ****/

final String getMyRatingsUrl = "ratings/get-my-rating";
final String getRatingsUrl = "architect/get-rating-by-id";


/**** Submission URL ****/
String getSubmissionsUrl(String id) => 'architect/submission/fetch-by-id/$id';
String floorPlanSubmissionUrl = 'architect/submission/floor-plan';
String threeDPlanSubmissionUrl = 'architect/submission/three-d-plan';
String interiorPlanSubmissionUrl = 'architect/submission/interior';
String structuralPlanSubmissionUrl = 'architect/submission/structural';
String electricalPlanSubmissionUrl = 'architect/submission/electrical';
String plumbingPlanSubmissionUrl = 'architect/submission/plumbing';