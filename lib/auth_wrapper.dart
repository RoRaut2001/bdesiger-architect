import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'API/api_client.dart';


class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  final SharedPreferences sharedPreferences = Get.find<SharedPreferences>();
  final ApiClient apiClient = Get.find<ApiClient>();

  Future<bool> getAuth() async {
    final String uid = await sharedPreferences.getString("uid") ?? "";
    final String token = await sharedPreferences.getString("token") ?? "";
    log("UID ${uid}, Token: ${token}");

    apiClient.updateHeader(token, uid);
    if (uid.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  void initState() {
    super.initState();
    log("Checking auth");
    _checkAuth();
  }

  void _checkAuth() async {
    bool isAuthenticated = await getAuth();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isAuthenticated) {
        log("Dashboard Navigation");
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else {
        log("Login Navigation");
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
