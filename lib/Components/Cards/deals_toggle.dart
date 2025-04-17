import 'package:b_designer_architecture/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:b_designer_architecture/Constants/constant_color.dart';

class DealsToggle extends StatefulWidget {
  final int? selectedIndex;
  final Function(int) onSelect;
  final List<String> labels;

  const DealsToggle({
    super.key,
    this.selectedIndex,
    required this.onSelect,
    required this.labels,
  });

  @override
  _DealsToggleState createState() => _DealsToggleState();
}

class _DealsToggleState extends State<DealsToggle> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...tabs.map((tab) {
          int index = tabs.indexOf(tab);
          return _buildTabButton(tab, index);
        }).toList(),
      ],
    );
  }

  final List<String> tabs = [
    "New", "Pending", "Completed"
  ];

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
