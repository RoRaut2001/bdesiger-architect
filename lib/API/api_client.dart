import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Constants/app_constant.dart';
import 'Model/error_response.dart';

class ApiClient extends GetxService {
  final String appBaseUrl;
  final SharedPreferences sharedPreferences;
  static final String noInternetMessage = 'Unable to connect to server'.tr;
  final int timeoutInSeconds = 40;

  late String liveToken;
  late String userId;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    liveToken = sharedPreferences.getString(token) ?? "";
    userId = sharedPreferences.getString(uid) ?? "";
    if (kDebugMode) {
      print('Token: $liveToken');
      print('UserId: $userId');
    }
    updateHeader(liveToken, userId);
  }

  void updateHeader(String token, String userId) {
    _mainHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    this.userId = userId;
    this.liveToken = token;
    if (kDebugMode) {
      print('Updated Headers: $_mainHeaders');
    }
  }

  Future<Response> getData(String uri, {Map<String, dynamic>? query, Map<String, String>? headers}) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $appBaseUrl$uri\nHeader: $_mainHeaders');
      }
      http.Response response = await http.get(
        Uri.parse(appBaseUrl + uri),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> postData(String uri, dynamic body, {Map<String, String>? headers, int? timeout}) async {
    try {
      if (kDebugMode) {
        log('====> API Call: $appBaseUrl$uri\nHeader: $_mainHeaders');
        print('====> API Body: $body');
      }
      http.Response response = await http.post(
        Uri.parse(appBaseUrl + uri),
        body: jsonEncode(body),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeout ?? timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      print('Error: $e');
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> postMultipartData(String uri, Map<String, dynamic> body, List<MultipartBody> multipartBody, {Map<String, String>? headers}) async {
    try {
      if (kDebugMode) {
        print('====> API Call:  $appBaseUrl$uri\nHeader: $_mainHeaders');
        print('====> API Body: $body with ${multipartBody.length} pictures');
      }
      http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(appBaseUrl + uri));
      // Create a mutable copy of _mainHeaders
      Map<String, String> requestHeaders = Map.from(_mainHeaders);

      // Remove Content-Type if it exists, as MultipartRequest will handle it
      requestHeaders.remove('Content-Type');
      requestHeaders.addAll({"Content-Type": "multipart/form-data"});

      // Add the modified headers to the request
      request.headers.addAll(requestHeaders);
      for (MultipartBody multipart in multipartBody) {
        if (multipart.isValid) {
          if (multipart.isWeb && multipart.webBytes != null) {
            request.files.add(http.MultipartFile(
              multipart.key,
              Stream.value(multipart.webBytes!),
              multipart.webBytes!.length,
              filename: multipart.filename ?? '${DateTime.now().toString()}.png',
            ));
          } else if (multipart.file != null) {
            Uint8List list = await multipart.file!.readAsBytes();
            request.files.add(http.MultipartFile(
              multipart.key,
              Stream.value(list),
              list.length,
              filename: multipart.filename ?? '${DateTime.now().toString()}.png',
            ));
          }
        }
      }

      final requestBody = _processReportFields(body);

      request.fields.addAll(requestBody);
      print("response"+body.toString());
      http.Response response = await http.Response.fromStream(await request.send());
      print("response");
      print("response"+response.body);
      return handleResponse(response, uri);
    } catch (e) {
      print('Error: $e');
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> putData(String uri, dynamic body, {Map<String, String>? headers}) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $appBaseUrl$uri\nHeader: $_mainHeaders');
        print('====> API Body: $body');
      }
      http.Response response = await http.put(
        Uri.parse(appBaseUrl + uri),
        body: jsonEncode(body),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      print('Error: $e');
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> deleteData(String uri, {Map<String, dynamic>? queryParameters, Map<String, String>? headers}) async {
    try {
      Uri url = Uri.parse(appBaseUrl + uri).replace(queryParameters: queryParameters);
      if (kDebugMode) {
        print('====> API Call: $url\nHeader: $_mainHeaders');
      }
      http.Response response = await http.delete(
        url,
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      print('Error: $e');
      return Response(statusCode: 1, statusText: "No Internet connection");
    }
  }

  Response handleResponse(http.Response response, String uri) {
    dynamic body;
    try {
      body = jsonDecode(response.body);
    } catch (e) {
      body = response.body;
      print("===>${body}");
    }

    Response response0 = Response(
      body: body ?? response.body,
      bodyString: response.body.toString(),
      request: Request(
          headers: response.request!.headers,
          method: response.request!.method,
          url: response.request!.url
      ),
      headers: response.headers,
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
    );

    if (kDebugMode) {
      print('====> API Response Handling Start');
      print('====> Request URI: $uri');
      print('====> Response Status Code: ${response0.statusCode}');
      print('====> Response Status Text: ${response0.statusText}');
      print('====> Response Headers: ${response0.headers}');
      print('====> Response Body: ${response0.bodyString}');
    }

    if (response0.statusCode != 200 && response0.body != null && response0.body is! String) {
      if (response0.body.toString().startsWith('{errors: [{code:')) {
        ErrorResponse errorResponse = ErrorResponse.fromJson(response0.body);
        response0 = Response(
            statusCode: response0.statusCode,
            body: response0.body,
            statusText: errorResponse.error
        );
      } else if (response0.body.toString().startsWith('{message')) {
        response0 = Response(
            statusCode: response0.statusCode,
            body: response0.body,
            statusText: response0.body['message']
        );
      }
    } else if (response0.statusCode != 200 && response0.body == null) {
      response0 = Response(
          statusCode: 0,
          statusText: noInternetMessage
      );
    }

    if (kDebugMode) {
      print('====> API Response Handling End');
      print('====> Processed Response Status Code: ${response0.statusCode}');
      print('====> Processed Response Status Text: ${response0.statusText}');
      print('====> Processed Response Body: ${response0.bodyString}');
    }

    return response0;
  }
}

Map<String, String> _processReportFields(Map<String, dynamic> reportData) {
  return reportData.map((key, value) {
    // Convert maps and lists to JSON strings
    if (value is Map || value is List) {
      return MapEntry(key, json.encode(value));
    }
    // Convert other types to string
    return MapEntry(key, value?.toString() ?? '');
  });
}


class MultipartBody {
  final String key;
  final XFile? file;           // Used for mobile/desktop
  final Uint8List? webBytes;   // Used for web
  final String? filename;      // Optional: useful for web uploads

  MultipartBody({
    required this.key,
    this.file,
    this.webBytes,
    this.filename,
  });

  bool get isWeb => kIsWeb;

  bool get isValid => (kIsWeb && webBytes != null) || (!kIsWeb && file != null);
}

