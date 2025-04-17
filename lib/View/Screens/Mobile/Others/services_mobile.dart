import 'package:flutter/material.dart';

class ServicesMobile extends StatelessWidget {
  const ServicesMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.black, width: 0.5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("Company - Our Services"),
              _buildSectionTitle("Our Services"),
              _buildParagraph(
                  "Our platform provides end-to-end architectural solutions using cutting-edge technology, automation, and structured workflows. We ensure smooth collaboration between clients, architects, and consultants, making architectural design, visualization, and project execution more efficient. From 2D and 3D designs to AR & VR visualization, automated tracking, and structured communication, we offer a comprehensive ecosystem for residential architecture projects."),
              const SizedBox(height: 10),
              _buildSectionTitle("1. 2D & 3D Architectural Design Services"),
              _buildParagraph(
                  "We offer complete design services to help clients visualize their dream homes before construction begins."),
              _buildSubTitle("2D Floor Plans"),
              _buildBulletPoint("Accurate room dimensions and layout"),
              _buildBulletPoint("Furniture placement suggestions"),
              _buildBulletPoint("Door and window positioning"),
              _buildBulletPoint("Wall thickness and construction details"),
              const SizedBox(height: 10),
              _buildSubTitle("3D House Elevation Designs"),
              _buildBulletPoint("High-quality 3D renders for a lifelike experience"),
              _buildBulletPoint("Multiple angles & lighting variations"),
              _buildBulletPoint("Exterior material and color selection suggestions"),
              _buildBulletPoint("Customization based on client preferences"),
              const SizedBox(height: 10),
              _buildSectionTitle("2. AR & VR Technology for Immersive Visualization"),
              _buildParagraph(
                  "We integrate Augmented Reality (AR) & Virtual Reality (VR) to provide a lifelike experience before construction even begins."),
              _buildBulletPoint("Walk through your home in Virtual Reality"),
              _buildBulletPoint("Augmented Reality previews for real-world comparison"),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildSectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSubTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, bottom: 3.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 14)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
