import 'package:b_designer_architecture/Controller/sidebar_controller.dart';
import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../../Components/Cards/footer.dart';
import '../../../Components/Cards/video_card.dart';
import '../../../Constants/constant_asset.dart';
import '../../../Controller/screen_controller.dart';
import '../../../Helper/Data/lists.dart';
import '../../../helper/Data/setter_fields.dart';

class HomeWeb extends StatelessWidget {
  HomeWeb({super.key});

  final ScrollController _scrollController = ScrollController();
  final ScreenController screenController = Get.find<ScreenController>();
  final SidebarController sidebarController = Get.find<SidebarController>();

  final List<String> items = features.take(9).toList();

  void _scrollList(bool forward) {
    double offset = _scrollController.offset + (forward ? 200 : -200);
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFBF4),
      child: ListView(
        children: [
          const SizedBox(height: 50),
          _buildGreetingTile(),
          SizedBox(height: 3.h),
          _buildDealsRow(),
          SizedBox(height: 3.h),
          _buildTaskCard(tasks: tasks),
          SizedBox(height: 3.h),
          _buildSectionTitle("Tutorials"),
          SizedBox(height: 1.h),
          _buildTutorials(),
          SizedBox(height: 3.h),
          _buildMoreFeatures(title: items),
          SizedBox(height: 3.h),
          const Footer()
        ],
      ),
    );
  }

  Widget _buildGreetingTile() {
    return Container(
      height: 70,
      width: double.infinity,
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 50),
        title: Text("Good Evening, team!", style: GoogleFonts.outfit(
            color: const Color(0xFF656565), fontWeight: FontWeight.w600, fontSize: 1.2.t)),
        subtitle: Text("Let's help you finish your workday", style: GoogleFonts.outfit(
            color: const Color(0xFF656565), fontWeight: FontWeight.w500, fontSize: 1.0.t)),
        trailing: const Icon(Icons.sunny_snowing, color: Colors.amber, size: 35),
      ),
    );
  }

  Widget _buildDealsRow() {
    final List<Map<String, dynamic>> dealCards = [
      {'title': 'New Deals', 'img': kaNewDeal, 'index': 0, 'subtitle': 'Access to new deals'},
      {'title': 'Completed Deals', 'img': kaCompletedDeals, 'index': 1},
      {'title': 'Pending Deals', 'img': kaPendingDeals, 'index': 2, 'subtitle': 'Access to new deals'},
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: dealCards.map((deal) => Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: _buildDealsCard(
              title: deal['title'],
              subtitle: deal['subtitle'],
              leading: deal['img'],
              onTap: () {
                sidebarController.selectedItem.value = 'Deals';
                screenController.selectedDealIndex.value = deal['index'];
              },
            ),
          )).toList(),
        ),
      ),
    );
  }

  Widget _buildDealsCard({required String title, String? subtitle, required VoidCallback onTap, required String leading}) {
    return InkWell(
      onTap: onTap,
      hoverColor: Colors.grey.shade200,
      child: Container(
        alignment: Alignment.center,
        height: 70,
        width: 43.w,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 0.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          leading: Image.asset(leading, height: 45, alignment: Alignment.center,),
          title: Text(title, style: GoogleFonts.outfit(fontSize: 13, fontWeight: FontWeight.w500)),
          subtitle: subtitle != null
              ? Text(subtitle, style: GoogleFonts.outfit(fontSize: 8, fontWeight: FontWeight.w400, color: const Color(0xFF7B7B7B)))
              : null,
          trailing: const Icon(Icons.arrow_forward_rounded),
        ),
      ),
    );
  }

  Widget _buildTaskCard({List<String>? tasks}) {
    return Container(

      margin: const EdgeInsets.symmetric(horizontal: 50.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.black, width: 0.5),
      ),
      child: Column(
        children: List.generate(
          (tasks?.length ?? 0).clamp(0, 4),
              (index) => ListTile(
            leading: const Icon(Icons.check_circle, color: Colors.orangeAccent, size: 25),
            title: Text(tasks?[index] ?? ""),
          ),
        ),
      ),
    );
  }

  Widget _buildTutorials() {
    return SizedBox(
      height: 150,
      child: Row(
        children: [
          IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded), onPressed: () => _scrollList(false)),
          Expanded(
            child: ListView.separated(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              separatorBuilder: (_, __) => const SizedBox(width: 30),
              itemBuilder: (_, index) => const SizedBox(
                width: 250,
                child: VideoCard(videoUrl: "https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4"),
              ),
            ),
          ),
          IconButton(icon: const Icon(Icons.arrow_forward_ios_rounded), onPressed: () => _scrollList(true)),
        ],
      ),
    );
  }

  Widget _buildMoreFeatures({required List<String> title}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      padding: const EdgeInsets.all(15.0),
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.black, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("More from BDesigner", style: GoogleFonts.outfit(fontSize: 1.3.t, fontWeight: FontWeight.w600)),
          SizedBox(height: 1.h),
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: title.length,
              itemBuilder: (context, index) => _buildFeatureTile(
                feature: title[index],
                onTap: () {},
                color: compatibleShades[index],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFeatureTile({required String feature, required VoidCallback onTap, required Color color}) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: color.withAlpha(60),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        title: Text(feature, style: GoogleFonts.outfit(fontSize: 1.t, fontWeight: FontWeight.bold)),
        trailing: InkWell(
          onTap: onTap,
          hoverColor: Colors.black12,
          child: Container(
            alignment: Alignment.center,
            height: 35,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color: color),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text("Check Now", style: GoogleFonts.outfit(fontSize: 0.9.t, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Text(title, style: GoogleFonts.outfit(fontSize: 1.5.t, fontWeight: FontWeight.bold)),
    );
  }

  final List<Color> compatibleShades = [
    const Color(0xFF8E3E8E), const Color(0xFF8E6E3E), const Color(0xFF6E2E8E),
    const Color(0xFFB05D8E), const Color(0xFF6E3E2E), const Color(0xFFD98E3E),
    const Color(0xFF5E2E6E), const Color(0xFF3E8E6E), const Color(0xFF8E8E3E),
    const Color(0xFF3E6E8E),
  ];
}
