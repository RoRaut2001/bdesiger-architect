import 'package:b_designer_architecture/Components/appbar.dart';
import 'package:b_designer_architecture/Constants/constant_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:get/get.dart';
import '../Constants/constant_asset.dart';
import '../Controller/screen_controller.dart';
import '../Helper/Data/setter_fields.dart';
import '../Helper/size_config.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ScreenController screenController = Get.find<ScreenController>();
  final SideMenuController controller = SideMenuController();




  final List<Map<String, dynamic>> items = [
    {
      "title": "Home",
      "icon": kaHome
    },
    {
      "title": "Deals",
      "icon": kaDeals
    },
    {
      "title": "Analytics",
      "icon": kaAnalytics
    },
    {
      "title": "Other",
      "icon": kaOther
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Appbar(),
          backgroundColor: kcLightBackground,
          body: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SideMenu(
                  backgroundColor: Colors.white,
                  mode: SideMenuMode.open,
                  hasResizerToggle: false,
                  resizerData: ResizerData(
                    resizerWidth: 1,
                    resizerColor: Colors.black
                  ),
                  builder: (data)=>SideMenuData(
                animItems: SideMenuItemsAnimationData(
                  duration: Duration(milliseconds: 600),
                ),
                customChild: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(4, (columnIndex){
                    return sideItem(items[columnIndex]["title"], items[columnIndex]["icon"], columnIndex == index, ()=>index.value = columnIndex, isExpansion: columnIndex == 3);
                  }),
                ),
              )),
              Expanded(child: Obx(()=>screenController.screens[index.value])),
            ],
          )
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initiateSize(context);
  }

  void initiateSize(BuildContext context){
    WidgetsBinding.instance.addPostFrameCallback((_){
      SizeConfig.init(
        BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
        ),
        MediaQuery.of(context).orientation,
      );
      setIsSizeInitialized(true);
    });
  }

  Widget sideItem(String title, String icon, bool isSelected, VoidCallback onTap, {bool? isExpansion}){
    return isExpansion ?? false ? ExpansionTile(
      shape: InputBorder.none,
      childrenPadding: EdgeInsets.symmetric(
        horizontal: 40.0
      ),
      children: List.generate(expansionItems.length, (columnIndex){
        final String title = expansionItems[columnIndex];
        return ListTile(
          onTap: ()=>index.value = columnIndex+3,
          title: Text(title, style: TextStyle(
            fontSize: 0.9.t,
            color: index == columnIndex+3 ? Colors.black : Color(0xFF6C6C6C),
            fontWeight: index == columnIndex+3 ? FontWeight.bold : FontWeight.w600
          ),),
        );
      }),
      tilePadding: EdgeInsets.only(
        left: 40
      ),
        leading: Image.asset(kaOther, height: 25,),
        title: Text(
      title,
      style: TextStyle(
        fontSize: 1.1.t,
        fontWeight: FontWeight.bold,
        color: Color(0xFF6C6C6C),
      ),
    )): InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
        height: 45,
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: isSelected ? Color(0xFFECECEC) : Colors.transparent
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 2.w),
            Image.asset(icon), // Fallback icon
            SizedBox(width: 1.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 1.1.t,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6C6C6C),
              ),
            )
          ],
        ),
      ),
    );
  }

  final List<String> expansionItems = [
    "Services",
    "About",
    "Contact",
    "Privacy Policy",
    "Terms & Condition"
  ];
}