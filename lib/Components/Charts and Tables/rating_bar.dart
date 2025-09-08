import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RatingBar extends StatelessWidget {
  final double rating;

  const RatingBar({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: SfLinearGauge(
        minimum: 3.9,
        maximum: 5.0,
        showTicks: false,
        showLabels: true,
        axisLabelStyle: const TextStyle(
          fontSize: 13,
          color: Color(0xFFC76C58),
          fontWeight: FontWeight.w500,
        ),
        axisTrackStyle: const LinearAxisTrackStyle(
          thickness: 30,
          color: Color(0xFFF5F5F5),
          edgeStyle: LinearEdgeStyle.bothFlat,
        ),
        labelFormatterCallback: (String value) {
          if (value == '5') {
            return value;
          }
          return value;
        },
        barPointers: [
          LinearBarPointer(
            value: rating.clamp(3.9, 5.0), // keep within range
            thickness: 30,
            edgeStyle: LinearEdgeStyle.bothFlat, // match track edges
            color: const Color(0xFFF98600), // fill color
          ),
        ],
        markerPointers: [
          LinearWidgetPointer(
            position: LinearElementPosition.outside,
            value: 4.8,
            child: Text(
              "Min",
              style: GoogleFonts.inter(
                color: const Color(0xFF505050),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          LinearWidgetPointer(
            value: 4.8,
            child: Container(
              height: 30,
              width: 1,
              color: Colors.black,
            ),
          ),
        ],
        onGenerateLabels: () {
          return [
            for (double i = 3.9; i <= 5.0; i += 0.2)
              LinearAxisLabel(text: i.toStringAsFixed(1), value: i),
            LinearAxisLabel(text: "4.8", value: 4.8),
            LinearAxisLabel(text: "5", value: 5),
          ];
        },
      ),
    );
  }
}
