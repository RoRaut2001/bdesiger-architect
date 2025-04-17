import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class PaintCard extends StatelessWidget {
  final String paintName, paintCode, paintImage;
  final VoidCallback onPreview, onEdit, onDelete;
  const PaintCard({super.key, required this.paintName, required this.paintCode, required this.paintImage, required this.onPreview, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 300,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Color(0xFF232323),
          width: 0.5
        )
      ),
      child: ListTile(
        title: Text(paintName, style: TextStyle(
            fontSize: 1.t,
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),),
        subtitle: Text(paintCode, style: TextStyle(
            fontSize: 1.t,
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),),
        trailing: Builder(
          builder: (context) {
            return InkWell(
              onTap: ()=>showOptions(context),
              child: Container(
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(25.0),
                    bottomLeft: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0),
                  ),
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(50),
                      offset: Offset(0, 4),
                      blurRadius: 4,
                    )
                  ],
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.0),
                        topRight: Radius.circular(25.0),
                        bottomLeft: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0),
                      ),
                      child: Image.network(paintImage),
                    ),
                    Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Icon(Icons.edit, size: 15,))
                  ],
                ),
              ),
            );
          }
        ),
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
