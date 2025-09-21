import 'package:flutter/material.dart';

class CustomFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final double width;
  final Function(bool) onSelected;

  const CustomFilterChip({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.width,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      showCheckmark: false,
      label: SizedBox(
        width: width,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.orange,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
      selected: isSelected,
      onSelected: onSelected,
      selectedColor: Colors.orange,
      checkmarkColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: Colors.orange.withOpacity(0.5),
        ),
      ),
    );
  }
}
