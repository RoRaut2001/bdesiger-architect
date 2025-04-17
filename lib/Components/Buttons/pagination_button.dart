import 'package:flutter/material.dart';

class PaginationButton extends StatelessWidget {
  final int index;
  final bool isSelected;
  final VoidCallback onTap;
  const PaginationButton({super.key, required this.index, required this.onTap, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          border: Border.all(
            color: isSelected
                ? Colors.black
                : Colors.black26, // Lighter border for inactive
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          '${index + 1}',
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black26,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
