import 'package:flutter/material.dart';

class TermsConditionWeb extends StatelessWidget {
  const TermsConditionWeb({super.key});

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
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("Terms & Conditions for Online Architectural Services"),
              _buildParagraph("Effective Date: 12/02/2025"),
              _buildParagraph("Last Updated: 12/02/2025"),
              _buildParagraph("Welcome to BDesigner. These Terms & Conditions govern your use of our online architectural services. By making a payment, registering an account, or using our platform, you acknowledge that you have read, understood, and agreed to these terms."),

              _buildSectionTitle("1. Introduction to Our Services"),
              _buildSubTitle("1.1 What We Offer"),
              _buildBulletPoint("2D Floor Plans (Room layouts with measurements)"),
              _buildBulletPoint("3D Elevation Designs (Exterior design visualization)"),
              _buildBulletPoint("Structural Layouts (Basic structural drawings & 3D Model Visualization)"),
              _buildBulletPoint("Electrical & Plumbing Drawings (Guidelines for wiring & pipelines)"),
              _buildBulletPoint("House Design Estimates (Approximate cost estimates for construction, up to G+4 floors)"),

              _buildSubTitle("1.2 Important Disclaimers"),
              _buildBulletPoint("We do NOT provide on-site supervision, physical inspections, or construction execution."),
              _buildBulletPoint("Our designs are based solely on the information provided by the client."),
              _buildBulletPoint("We do NOT guarantee the safety, feasibility, or durability of the structure unless reviewed by a local licensed engineer."),
              _buildBulletPoint("We do NOT provide government approvals, local permits, or legal documentation."),

              _buildSectionTitle("2. Payment Terms & Refund Policy"),
              _buildSubTitle("2.1 Payment Structure"),
              _buildBulletPoint("Clients must make a 100% upfront payment before work begins."),
              _buildBulletPoint("Scheduled payment plans require 50% upfront and 50% before final file delivery."),
              _buildBulletPoint("Payments must be made through secure payment gateways available in the app."),

              _buildSubTitle("2.2 No Refund Policy"),
              _buildBulletPoint("Once work has started, no refunds will be provided."),
              _buildBulletPoint("Partial refunds may be issued if cancellation happens before work begins."),
              _buildBulletPoint("Refunds will NOT be given for change of mind after design approval or client delays.")
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
