import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Controller/report_controller.dart';

class RevisionCardMobile extends StatelessWidget {
  final String totalRevision;
  final String remainingRevision;
  final String extraRevision;

  RevisionCardMobile({
    super.key,
    required this.totalRevision,
    required this.remainingRevision,
    required this.extraRevision,
  }) {
    final ReportController controller  = Get.find<ReportController>();
    controller.setValues(
      total: totalRevision,
      remaining: remainingRevision,
      extra: extraRevision,
    );
  }

  @override
  Widget build(BuildContext context) {

    final ReportController controller = Get.find();

    return Container(
      width: 200,
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: const Color(0xFF4F4F4F)),
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
              _buildRevisionField(title: "Total Revision", controller: controller.totalRevision),
              _buildRevisionField(title: "Remaining Revision", controller: controller.remainingRevision),
              _buildRevisionField(title: "Extra Revision", controller: controller.extraRevision),
            ],
          ),
          const Divider(color: Color(0xFF4F4F4F)),
          Text(
            "BASED ON COMPLETED REVISIONS IN CHAT",
            style: GoogleFonts.inter(
              fontSize: 7,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF4F4F4F),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRevisionField({required String title, required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          SizedBox(
            width: 40,
            child: TextFormField(
              controller: controller,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              cursorColor: Colors.black,
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF4F4F4F),
              ),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                isDense: true,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          Text(
            "${title.split(" ").first}\n${title.split(" ").last}",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 7,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF4F4F4F),
            ),
          ),
        ],
      ),
    );
  }
}
