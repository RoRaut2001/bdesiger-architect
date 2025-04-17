import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:flutter/material.dart';

class ArFilePreview extends StatelessWidget {
  final String src, title;
  const ArFilePreview({super.key, required this.src, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            title: Text(title,style: TextStyle(
              fontSize: 1.5.t,
              color: Colors.black,
              fontWeight: FontWeight.w500
            ),),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
              height: 500,
              child: Flutter3DViewer.obj(
                  src: src,
                scale: 5,
              ))
        ],
      ),
    );
  }
}
