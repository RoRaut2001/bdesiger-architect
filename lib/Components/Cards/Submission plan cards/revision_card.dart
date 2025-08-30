import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Controller/report_controller.dart';


class RevisionCard extends StatelessWidget {
  final String totalRevision;
  final String remainingRevision;
  final String extraRevision;

  RevisionCard({
    super.key,
    required this.totalRevision,
    required this.remainingRevision,
    required this.extraRevision,
  }) {
    // Initialize controller and set values
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
      width: 275,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
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
              fontSize: 8,
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
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          SizedBox(
            width: 40,
            height: 28,
            child: TextFormField(
              controller: controller,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              cursorColor: Colors.black,
              style: GoogleFonts.inter(
                fontSize: 18,
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
              fontSize: 9,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF4F4F4F),
            ),
          ),
        ],
      ),
    );
  }

}
