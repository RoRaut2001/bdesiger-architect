import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

enum SubmissionItemType {
  AR("AR"),
  Image("Image"),
  Video("Video"),
  VR("VR");

  final String label;

  const SubmissionItemType(this.label);
}


class SubmissionItem extends StatelessWidget {
  final String submissionName;
  final String? link;
  final VoidCallback onPreview, onDelete, onEdit;
  const SubmissionItem({super.key, required this.submissionName, required this.onPreview, required this.onDelete, required this.onEdit, this.link});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 350,
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 0.5
        ),
        borderRadius: BorderRadius.circular(
          15.0
        ),
        color: Colors.white
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(submissionName, style: TextStyle(
            fontSize: 1.t,
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),),
          Spacer(),
          Builder(
            builder: (buttonContext) {
              return IconButton(onPressed: ()=>showOptions(buttonContext), icon: Icon(Icons.more_horiz_rounded, color: Colors.black, size: 20,));
            }
          )
        ],
      ),
    );
  }

  void showOptions(BuildContext context){
    showPopover(
      arrowWidth: 0,
        radius: 0,
        arrowHeight: 0,
        barrierColor: Colors.transparent,
        context: context,
        bodyBuilder: (context){
      return Container(
        padding: EdgeInsets.only(
          top: 10.0
        ),
        width: 80,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: onPreview,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 0.8
                  )
                ),
                child: Text("Preview", style: TextStyle(
                    fontSize: 0.9.t,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),),
              ),
            ),
            InkWell(
              onTap: onEdit,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 0.8
                  )
                ),
                child: Text("Edit", style: TextStyle(
                    fontSize: 0.9.t,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),),
              ),
            ),
            InkWell(
              onTap: onDelete,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 0.8
                  )
                ),
                child: Text("Delete", style: TextStyle(
                    fontSize: 0.9.t,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),),
              ),
            ),
          ],
        ),
      );
    });
  }
}
