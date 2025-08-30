import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../API/Model/charge_model.dart';
import 'charge_tile_widget.dart';

class ChargeSectionWidget extends StatelessWidget {
  final ChargeSection section;

  const ChargeSectionWidget({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(section.sectionName, style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500)),
        Container(height: 2, width: 80, color: Colors.black),
        const SizedBox(height: 20),
        GridView.builder(
          shrinkWrap: true,
          physics:  NeverScrollableScrollPhysics(),
          itemCount: section.items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 10,
            crossAxisSpacing: 20,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (_, index) {
            final item = section.items[index];
            return ChargeTileWidget(item: item);
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
