import 'package:b_designer_architecture/Components/Cards/footer.dart';
import 'package:b_designer_architecture/Components/Cards/video_card.dart';
import 'package:b_designer_architecture/Constants/constant_asset.dart';
import 'package:b_designer_architecture/Constants/constant_color.dart';
import 'package:b_designer_architecture/Controller/screen_controller.dart';
import 'package:b_designer_architecture/Helper/Data/setter_fields.dart';
import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Helper/Data/lists.dart';
import 'package:get/get.dart';

class HomeWeb extends StatelessWidget {
  HomeWeb({super.key});

  final ScrollController _scrollController = ScrollController();
  final ScreenController screenController = Get.find<ScreenController>();

  void _scrollList(bool forward) {
    double offset = _scrollController.offset + (forward ? 200 : -200);
    _scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }


  final List<String> items = features.take(9).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kcLightBackground
      ),
      child: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            height: 70,
            width: double.maxFinite,
            color: Colors.white,
            child: ListTile(
              contentPadding: EdgeInsets.only(
                left: 50.0,
                right: 20.0
              ),
              title: Text("Good Evening, team!", style: GoogleFonts.outfit(
                color: Color(0xFF656565),
                fontWeight: FontWeight.w600,
                fontSize: 1.2.t
              ),),
              subtitle: Text("Let's help you finish your workday", style: GoogleFonts.outfit(
                  color: Color(0xFF656565),
                  fontWeight: FontWeight.w500,
                  fontSize: 1.0.t
              ),),
              trailing: Icon(Icons.sunny_snowing, color: Colors.amber, size: 35,),
            ),
          ),
          SizedBox(
            height: 3.h
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 50.0
            ),
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildDealsCard(leading: kaNewDeal, title: "New Deals", onTap: (){
                  index.value = 1;
                  screenController.selectedDealIndex.value = 0;
                }, subtitle: "Access to new deals"),
                _buildDealsCard(leading: kaCompletedDeals, title: "Completed Deals", onTap: (){
                  index.value = 1;
                  screenController.selectedDealIndex.value = 1;
                }),
                _buildDealsCard(leading: kaPendingDeals, title: "Pending Deals", onTap: (){
                  index.value = 1;
                  screenController.selectedDealIndex.value = 2;
                }, subtitle: "Access to new deals"),
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          _buildTaskCard(tasks: tasks),
          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50.0
            ),
            child: Text("Tutorials", style: TextStyle(
              fontSize: 1.5.t,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),),
          ),
          SizedBox(
            height: 1.h,
          ),
          _buildTutorials(),
          SizedBox(
            height: 3.h,
          ),
          _buildMoreFeatures(title: items),
          SizedBox(
            height: 3.h,
          ),
          Footer()
        ],
      ),
    );
  }


  Widget _buildDealsCard({required String title, String? subtitle, required VoidCallback onTap, required String leading}){
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 7.h,
        width: 35.w,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 0.5
          ),
          borderRadius: BorderRadius.circular(10.0)
        ),
        child:  ListTile(
          leading: Image.asset(leading, height: 80,),
          title: Text(title, style: TextStyle(
            fontSize: 1.1.t,
            fontWeight: FontWeight.w600,
            color: Colors.black
          ),),
          subtitle: subtitle!=null ? Text(subtitle, style: TextStyle(
            fontSize: 0.7.t,
            fontWeight: FontWeight.w500,
            color: Color(0xFF7B7B7B)
          ),) : null,
          trailing: Icon(Icons.arrow_forward_rounded, color: Colors.black,),
        ),
      ),
    );
  }
  Widget _buildTaskCard({List<String>? tasks}){
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 50.0
      ),
      width: double.maxFinite,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.black,
          width: 0.5
        ),
        color: Colors.white
      ),
      child: Column(
          children: List.generate(4, (columnIndex){
            final String task = tasks?[columnIndex] ?? "";
            return ListTile(
              leading: Icon(Icons.check_circle, color: Colors.orangeAccent, size: 25,),
              title: Text(task),
            );
          })
      ),
    );
  }
  Widget _buildTutorials(){
    return SizedBox(
      height: 150,
      width: double.maxFinite,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => _scrollList(false),
          ),
          Expanded(
            child: ListView.separated(
              controller: _scrollController, // Assign ScrollController
              scrollDirection: Axis.horizontal,
              itemCount: 10, // Replace with tutorials?.length if available
              padding: EdgeInsets.symmetric(horizontal: 8),
              separatorBuilder: (_, __) => SizedBox(width: 30),
              itemBuilder: (context, index) {
                return VideoCard(videoUrl: "https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4");
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios_rounded),
            onPressed: () => _scrollList(true),
          ),
        ],
      ),
    );
  }
  Widget _buildMoreFeatures({required List<String> title}){
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.symmetric(
        horizontal: 30.0
      ),
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.black,
          width: 0.5
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("More from BDesigner", style: GoogleFonts.outfit(
            fontSize: 1.3.t,
            color: Colors.black,
            fontWeight: FontWeight.w600
          ),),
          SizedBox(
            height: 1.h,
          ),
          Expanded(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: title.length,
                  itemBuilder: (context, index){
                    final String feature = title[index];
            return _buildFeatureTile(feature: feature, onTap: (){}, color: compatibleShades[index]);
          }))
        ],
      ),
    );
  }
  Widget _buildFeatureTile({required String feature, required VoidCallback onTap, required Color color}){
    return Container(
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0
      ),
      decoration: BoxDecoration(
        color: color.withAlpha(60),
        borderRadius: BorderRadius.circular(15.0)
      ),
      child: ListTile(
        title: Text(feature, style: GoogleFonts.outfit(
          fontSize: 1.t,
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),),
        trailing: InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            height: 35,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: color,
              ),
              borderRadius: BorderRadius.circular(10.0)
            ),
            child: Text("Check Now", style: GoogleFonts.outfit(
                fontSize: 0.9.t,
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),),
          ),
        ),
      ),
    );
  }

  List<Color> compatibleShades = [
    Color(0xFF8E3E8E), // Deep Magenta Purple
    Color(0xFF8E6E3E), // Warm Brownish Orange
    Color(0xFF6E2E8E), // Dark Purple
    Color(0xFFB05D8E), // Mauve Pink
    Color(0xFF6E3E2E), // Burnt Red-Brown
    Color(0xFFD98E3E), // Warm Golden Orange
    Color(0xFF5E2E6E), // Dark Plum
    Color(0xFF3E8E6E), // Teal Green
    Color(0xFF8E8E3E), // Muted Olive
    Color(0xFF3E6E8E), // Deep Blue Teal
  ];
}
