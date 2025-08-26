import 'dart:developer';
import 'package:b_designer_architecture/route_definations.dart';
import 'package:b_designer_architecture/route_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';
import 'helper/get_di.dart' as di;
import 'helper/size_config.dart';
import 'package:media_kit/media_kit.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.init();
  MediaKit.ensureInitialized();
  log("Dependencies initialized");
  runApp(MyApp());
  log("App Running");
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(builder: (BuildContext context2, Orientation orientation){
          SizeConfig.init(constraints, orientation);
          log("Size config initialized");
          log("Running Material App");
          return GetMaterialApp(
            title: "BDesigner",
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFF3D48A)),
              textTheme: GoogleFonts.robotoTextTheme(),
              primaryColor: Color(0xFFF3D48A),
            ),
            builder: EasyLoading.init(),
            onGenerateRoute: RouteManager.generateRoute,
            initialRoute: '/auth',
            routes: routes,
            // home: AuthWrapper(),
            debugShowCheckedModeBanner: false,
          );
        });
      },
    );
  }
}
