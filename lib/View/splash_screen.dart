import 'package:b_designer_architecture/API/api_client.dart';
import 'package:b_designer_architecture/Helper/Data/setter_fields.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Constants/constant_asset.dart';
import '../Constants/constant_color.dart';
import 'package:get/get.dart';

import '../Helper/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(kaMainLogo)),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    final SharedPreferences sharedPreferences = Get.find<SharedPreferences>();
    final ApiClient apiClient = Get.find<ApiClient>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SizeConfig.init(
        BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
        ),
        MediaQuery.of(context).orientation,
      );
      setIsSizeInitialized(true);
      Future.delayed(Duration(seconds: 3), () async{
        final String uid = await sharedPreferences.getString("uid") ?? "";
        final String token = await sharedPreferences.getString("token") ?? "";
        apiClient.updateHeader(token, uid);
        if (uid.isEmpty) {
          Navigator.pushNamed(Get.context!, '/login');
        } else {
          Navigator.pushNamed(Get.context!, '/home');
        }
      });
    });
  }
}
