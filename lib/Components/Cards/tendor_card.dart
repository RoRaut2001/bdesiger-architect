import 'package:b_designer_architecture/Constants/constant_color.dart';
import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Model/tendor.dart';

class TenderCard extends StatelessWidget {
  final Tender tender;

  TenderCard({required this.tender});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 6.0
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10.0
      ),
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Container(
              height: 30,
              width: 240,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: kcGrey,
              ),
              child: Text(tender.service, style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),),
            ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(timeAgo(tender.createdAt),  style: TextStyle(fontSize: 8, fontWeight: FontWeight.w500, color: Colors.black),),
              ),
            ]
          ),
          SizedBox(
            height: 1.h,
          ),
          Expanded(child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 5,
              childAspectRatio: 8/1
            ),
            children: [
              DetailsTag(title: "Name", value: "Rajesh", isName: true, icon: 'https://res.cloudinary.com/dculivch8/image/upload/v1736167992/person_v26zso.svg',),
              DetailsTag(title: "Built Area", value: "1200 sq.ft.", isName: false, icon: 'https://res.cloudinary.com/dculivch8/image/upload/v1736167992/builtupArea_brvnci.svg',),
              DetailsTag(title: "Location", value: "Mumbai", isName: false, icon: 'https://res.cloudinary.com/dculivch8/image/upload/v1736167992/location_mfoba3.svg',),
              DetailsTag(title: "Floors", value: "G + 2", isName: false, icon: 'https://res.cloudinary.com/dculivch8/image/upload/v1736167992/floor_voetz4.svg',)
            ],
            shrinkWrap: true,
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomButton(title: "Know More", icon: "https://res.cloudinary.com/dculivch8/image/upload/v1736243071/next_d9mgiy.svg", onTap: (){}, isBlack: false),
              BottomButton(title: "Get This Deal", icon: "https://res.cloudinary.com/dculivch8/image/upload/v1736243212/deal_dxkrqh.svg", onTap: (){}, isBlack: true),
            ],
          )
        ],
      ),
    );
  }

  String timeAgo(DateTime dateTime) {
    final duration = DateTime.now().difference(dateTime);

    if (duration.inDays > 0) {
      return '${duration.inDays} day${duration.inDays > 1 ? 's' : ''} ago';
    } else if (duration.inHours > 0) {
      return '${duration.inHours} hour${duration.inHours > 1 ? 's' : ''} ago';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes} min${duration.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }
}

class DetailsTag extends StatelessWidget {
  final String title;
  final String value;
  final bool isName;
  final String icon;
  const DetailsTag({super.key, required this.title, required this.value, required this.isName, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(
        horizontal: 10.0
      ),
      decoration: BoxDecoration(
        color: isName ? kcGrey : Colors.transparent,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(5.0),
          bottomRight: Radius.circular(5.0)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.network(icon,fit: BoxFit.scaleDown, height: 1.h, width: 1.w,),
          SizedBox(width: 10,),
          Text("$title :", style: TextStyle(
            fontSize: 1.t,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),),
          SizedBox(
            width: 1.w,
          ),
          Text(value, style: TextStyle(
            fontSize: 1.t,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  final String title, icon;
  final VoidCallback onTap;
  final bool isBlack;
  const BottomButton({super.key, required this.title, required this.icon, required this.onTap, required this.isBlack});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
        height: 40,
        width: 20.w,
        alignment: Alignment.center,
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: isBlack ? Colors.black : Color(0xFFE4E4E4),
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: isBlack ? Colors.transparent : Color(0xFF6A6A6A)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
              fontSize: 1.1.t,
              fontWeight: FontWeight.w600,
              color: isBlack ? Colors.white : Colors.black
            ),),
            SizedBox(width: 10,),
            SvgPicture.network(icon, fit: BoxFit.scaleDown, height: 1.h, width: 1.w,),
          ],
        ),
      ),
    );
  }
}

