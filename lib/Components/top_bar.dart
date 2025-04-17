import 'package:b_designer_architecture/Components/Buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:b_designer_architecture/Constants/constant_color.dart';
import 'package:b_designer_architecture/Helper/size_config.dart';

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback onContact;
  final int? selectedIndex;
  final Function(int) onSelect;

  const TopBar({super.key, this.selectedIndex, required this.onSelect, required this.onContact});

  @override
  _TopBarState createState() => _TopBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _TopBarState extends State<TopBar> {
  List<String> tabs = ["Home", "Deals", "Analytics", "Profile"];
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.transparent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            "https://res.cloudinary.com/dculivch8/image/upload/v1733553206/official_logo_transparent_viocqf.png",
            width: 10.w,
          ),
          Spacer(),
          ...tabs.map((tab) {
            int index = tabs.indexOf(tab);
            return _buildTabButton(tab, index);
          }).toList(),
          SizedBox(
            width: 10.w,
          ),
          PrimaryButton(title: "Contact Us", onTap: widget.onContact, isHollow: true,)
        ],
      ),
    );
  }

  Widget _buildTabButton(String label, int index) {
    bool isSelected = selectedIndex == index;
    return Container(
      width: 15.w,
      child: Column(
        children: [
          TextButton(
            style: ButtonStyle(
              overlayColor: WidgetStatePropertyAll(Colors.transparent),
              splashFactory: NoSplash.splashFactory,
            ),
            onPressed: () {
              widget.onSelect(index);
              setState(() {
                selectedIndex = index;
              });
            },
            child: Text(
              label,
              style: TextStyle(
                fontSize: 1.1.t,
                color: kcNavyBlue,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w200,
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 2.0,
            width: isSelected ? 10.w : 0.0,
            color: kcNavyBlue,
            curve: Curves.easeInOut,
          ),
        ],
      ),
    );
  }
}
