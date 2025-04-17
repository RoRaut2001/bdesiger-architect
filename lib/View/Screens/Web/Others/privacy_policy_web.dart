import 'package:flutter/material.dart';

class PrivacyPolicyWeb extends StatelessWidget {
  const PrivacyPolicyWeb({super.key});

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
              _buildSectionTitle("Privacy Policy"),
              _buildSubTitle("Effective Date: [12/02/25]"),
              _buildSubTitle("Last Updated: [12/02/25]"),
              _buildParagraph("Welcome to BDesigner (\"we,\" \"our,\" or \"us\"). Your privacy is important to us. This Privacy Policy explains how we collect, use, store, and protect your personal information when you use our mobile application and services."),
              _buildParagraph("By using our platform, you agree to the collection and use of information in accordance with this policy. If you do not agree, please do not use our services."),

              _buildSectionTitle("1. Information We Collect"),
              _buildSubTitle("1.1 Personal Information"),
              _buildBulletPoint("Name"),
              _buildBulletPoint("Email address"),
              _buildBulletPoint("Phone number"),
              _buildBulletPoint("Billing details (for payment verification)"),
              _buildBulletPoint("Profile information (for architects & consultants)"),

              _buildSubTitle("1.2 Non-Personal Information"),
              _buildBulletPoint("Device information (model, OS version, app version, etc.)"),
              _buildBulletPoint("IP address & location data (with your permission)"),
              _buildBulletPoint("App usage behavior (for analytics and improvement)"),

              _buildSubTitle("1.3 Cookies & Tracking Technologies"),
              _buildParagraph("We use cookies, log files, and tracking technologies to improve app functionality, personalize content, and analyze trends. You can disable cookies in your browser settings, but some features may not work properly."),

              _buildSectionTitle("2. How We Use Your Information"),
              _buildBulletPoint("Providing and managing services – Enabling chat, project collaboration, and architectural services."),
              _buildBulletPoint("User authentication & security – Protecting against fraud, spam, and unauthorized access."),
              _buildBulletPoint("Improving user experience – Enhancing app functionality through analytics."),
              _buildBulletPoint("Processing payments – Verifying transactions for client-architect projects."),
              _buildBulletPoint("Customer support & dispute resolution – Assisting users with inquiries and resolving disputes."),
              _buildBulletPoint("Sending notifications & updates – Informing users about important changes, deadlines, and service improvements."),

              _buildSectionTitle("3. How We Share Your Information"),
              _buildParagraph("We do not sell or rent your personal information. However, we may share your data in the following cases:"),
              _buildBulletPoint("With consultants & architects – To facilitate project collaboration and approvals."),
              _buildBulletPoint("With payment processors – To verify and complete transactions securely."),
              _buildBulletPoint("With legal authorities – If required by law, to comply with legal obligations or protect our platform."),
              _buildBulletPoint("With service providers – Third-party analytics, hosting, and support services that help operate the app."),

              _buildSectionTitle("4. Data Security & Protection"),
              _buildBulletPoint("Encryption – Secure storage and transmission of sensitive data."),
              _buildBulletPoint("Access Controls – Limiting access to authorized personnel only."),
              _buildBulletPoint("Regular Security Audits – Identifying and addressing potential vulnerabilities."),

              _buildSectionTitle("5. Your Rights & Choices"),
              _buildBulletPoint("Access & Update Information – Edit your profile, payment settings, or preferences anytime."),
              _buildBulletPoint("Delete Your Account – Request account deletion through the app settings or by contacting support."),
              _buildBulletPoint("Opt-Out of Notifications – Disable marketing emails, app notifications, or promotional messages in settings."),
              _buildBulletPoint("Withdraw Consent – Disable location tracking or restrict data collection through your device settings."),
              _buildParagraph("For any data-related requests, contact us at help.bdesigner@gmail.com."),

              _buildSectionTitle("6. Third-Party Services & External Links"),
              _buildParagraph("Our app may contain links to third-party websites or services. We are not responsible for their privacy practices. We recommend reviewing their privacy policies before using their services."),

              _buildSectionTitle("7. Children's Privacy"),
              _buildParagraph("Our services are not intended for users under the age of 13. We do not knowingly collect personal data from children. If you believe a child has provided us with information, contact us to remove it."),

              _buildSectionTitle("8. Changes to This Privacy Policy"),
              _buildParagraph("We may update this Privacy Policy from time to time. When we make changes, we will notify users via email or in-app notifications. Please review this page periodically for updates."),

              _buildSectionTitle("9. Contact Us"),
              _buildParagraph("If you have any questions or concerns about this Privacy Policy, feel free to contact us:"),
              _buildBulletPoint("Email: help.bdesigner@gmail.com"),
              _buildBulletPoint("Website: www.bdesigner.online"),
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
