import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Constants/constant_asset.dart';

class SubmissionPageHeadingsIcons extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String tooltipMessage;

  const SubmissionPageHeadingsIcons({
    super.key,
    this.imageUrl =
    'https://res.cloudinary.com/dculivch8/image/upload/v1742369173/floorPlan_rvg6uw.png',
    this.title = 'Form Filling Pages',
    this.tooltipMessage =
    "• Upload youtube video link.\n• Use ratio in portrait mode. (1080x1920)",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildHeaderButton(),
        const SizedBox(width: 10),
        _buildInfoIcon(),
      ],
    );
  }

  Widget _buildHeaderButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.network(
            imageUrl,
            width: 20,
            height: 20,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image, size: 20),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoIcon() {
    return Tooltip(
      textAlign: TextAlign.left,
      preferBelow: false,
      verticalOffset: 0,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFAEAEAE)),
        color: Colors.white,
      ),
      textStyle: const TextStyle(color: Colors.black, fontSize: 13),
      message: tooltipMessage,
      child: SvgPicture.asset(kaInfoSvg, width: 20),
    );
  }
}
