import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:flutter/material.dart';

class RevisionCard extends StatelessWidget {
  final String totalRevision, remainingRevision, extraRevision;
  const RevisionCard({super.key, required this.totalRevision, required this.remainingRevision, required this.extraRevision});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Color(0xFF4F4F4F)
        ),
        color: Colors.transparent,
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRevisionCount(title: "Total Revision", count: "5"),
              _buildRevisionCount(title: "Remaining Revision", count: "3"),
              _buildRevisionCount(title: "Extra Revision", count: "0"),
            ],
          ),
          Divider(
            color: Color(0xFF4F4F4F),
          ),
          Text("BASED ON COMPLETED REVISIONS IN CHAT", style: TextStyle(
            fontSize: 0.8.t,
            fontWeight: FontWeight.w600,
            color: Color(0xFF4F4F4F)
          ),)
        ],
      ),
    );
  }

  Widget _buildRevisionCount({required String title, required String count}){
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(count, style: TextStyle(
            fontSize: 1.5.t,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4F4F4F)
          ),),
          Text("${title.split(" ").first}\n${title.split(" ").last}",
            textAlign: TextAlign.center,
            style: TextStyle(
            fontSize: 0.9.t,
            fontWeight: FontWeight.bold,
              color: Color(0xFF4F4F4F)
          ),),
        ],
      ),
    );
  }
}
