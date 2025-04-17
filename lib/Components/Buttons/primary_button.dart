import 'package:b_designer_architecture/Constants/constant_color.dart';
import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool? isHollow;
  const PrimaryButton({super.key, required this.title, required this.onTap, this.isHollow = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashFactory: NoSplash.splashFactory,
      overlayColor: WidgetStatePropertyAll(kcOrange.withOpacity(0.05)),
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        height: 45,
        width: 20.w,
        decoration: BoxDecoration(
          color: isHollow! ? Colors.transparent : kcOrange,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: isHollow! ? kcOrange : Colors.transparent,
            width: 1
          ),
        ),
        alignment: Alignment.center,
        child: Text(title, style: TextStyle(
          color: isHollow! ? kcOrange : Colors.white,
          fontSize: 1.t
        ),),
      ),
    );
  }
}
