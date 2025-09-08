import 'package:flutter/material.dart';

class AboutWeb extends StatelessWidget {
  const AboutWeb({super.key});

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
              _buildSectionTitle("About Us"),
              _buildParagraph("We are a tech-driven platform dedicated to transforming the architectural industry by seamlessly connecting clients, architects, and consultants. Our goal is to simplify and enhance the process of designing, planning, and executing residential projects through AI-powered automation, AR & VR technology, and structured workflows. We provide a transparent, efficient, and immersive experience that allows clients to visualize their dream homes before construction begins."),
              _buildSectionTitle("Our Vision & Mission"),
              _buildParagraph("Our vision is to redefine architectural services by making high-quality designs, collaboration, and project execution more accessible, interactive, and efficient for everyone. We strive to bridge the gap between clients and professionals by integrating cutting-edge technology, automation, and a structured rating system to ensure quality service."),
              _buildBulletPoint("Empower Clients by providing verified professionals, immersive design previews, and flexible payment options."),
              _buildBulletPoint("Support Architects & Consultants with a streamlined workflow, automated tracking, and performance-based rewards."),
              _buildBulletPoint("Enhance Visualization & Collaboration through AR & VR technology, allowing clients to interact with and refine designs in real time."),
              _buildBulletPoint("Increase Efficiency with an automated approval system, deadline tracking, and smart notifications, minimizing delays and miscommunication."),
              _buildSectionTitle("How It Works"),
              _buildNumberedPoint("Clients submit their project details and make an initial payment to begin."),
              _buildNumberedPoint("Consultants join first, approve project details, and assign architects."),
              _buildNumberedPoint("Architects apply, get verified, and start working on the design."),
              _buildNumberedPoint("Clients track progress, communicate via chat, and experience their designs in AR/VR before finalization."),
              _buildNumberedPoint("Project Completion – Final files are delivered, and payments are settled securely."),
              _buildSectionTitle("What We Offer"),
              _buildBulletPoint("2D & 3D Floor Plans, Structural, Electrical, and Plumbing Layouts"),
              _buildBulletPoint("Augmented & Virtual Reality (AR/VR) Visualization for realistic design previews"),
              _buildBulletPoint("Automated Project Tracking & Deadline Monitoring"),
              _buildBulletPoint("Smart Chat-Based Collaboration for clients, architects, and consultants"),
              _buildBulletPoint("Flexible & Secure Payments with schedule-wise options and dispute resolution"),
              _buildBulletPoint("Architect Rating & Reward System to ensure high-quality service"),
              _buildSectionTitle("Frequently Asked Questions (FAQ)"),
              _buildFAQ("How do I find an architect for my project?", "Clients submit their project details, and consultants review and assign an architect based on their experience and ratings."),
              _buildFAQ("What if I need to modify my payment plan?", "Clients can request payment modifications, which are reviewed by consultants. If a modification is denied, clients have the option to appeal the decision."),
              _buildFAQ("How does AR/VR help in my project?", "Our Augmented & Virtual Reality features allow clients to preview and walk through their house designs before final approval, making the decision process more interactive and precise."),
              _buildFAQ("How are architects rated?", "Architects are rated based on response time, service delivery, estimate accuracy, audit performance, and client feedback. High ratings grant them priority for new projects, while consistently low ratings may result in temporary restrictions."),
              _buildFAQ("What happens if an architect underperforms?", "Underperforming architects may face temporary restrictions from applying to new projects. However, they can appeal their rating for reconsideration."),
              _buildFAQ("How does the automated deadline tracking work?", "Our system monitors deadlines, sends automated reminders, and allows consultants to extend deadlines under specific conditions. Penalties may apply for overdue projects."),
              _buildSectionTitle("Why Choose Us?"),
              _buildBulletPoint("Verified & Approved Professionals – All architects and consultants go through a strict approval process."),
              _buildBulletPoint("AR & VR-Powered Visualization – Clients can see and experience designs in real-time before construction."),
              _buildBulletPoint("Automation & Transparency – Automated project tracking, deadline reminders, and structured workflows reduce manual efforts."),
              _buildBulletPoint("Fair & Reward-Based System – High-performing architects get priority, while a penalty system ensures service quality."),
              _buildBulletPoint("Flexible Payment Plans – Clients can choose schedule-wise payments, request modifications, and appeal decisions when necessary."),
              _buildBulletPoint("Smart Collaboration – Clients, architects, and consultants communicate through structured chat groups to ensure smooth workflow."),
              _buildSectionTitle("Testimonials"),
              _buildParagraph("\"This platform made my home design process effortless. Seeing my house in VR before construction helped me make better decisions.\" – A Happy Client"),
              _buildParagraph("\"As an architect, the automated system and AR integration have improved client interactions and design approvals.\" – A Verified Architect"),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildSectionTitle(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  );

  Widget _buildParagraph(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Text(text, style: const TextStyle(fontSize: 14, height: 1.5)),
  );

  Widget _buildBulletPoint(String text) => Padding(
    padding: const EdgeInsets.only(left: 15.0, bottom: 3.0),
    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text("• ", style: TextStyle(fontSize: 14)),
      Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
    ]),
  );

  Widget _buildNumberedPoint(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 3.0),
    child: Text(text, style: const TextStyle(fontSize: 14)),
  );

  Widget _buildFAQ(String question, String answer) => Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(question, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      Text(answer, style: const TextStyle(fontSize: 14, height: 1.5)),
    ]),
  );
}
