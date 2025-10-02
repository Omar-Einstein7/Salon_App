import 'package:flutter/material.dart';
import 'package:salon_app/core/config/widgets/custom_container_wdt.dart';

class PaymentOptionWdgt extends StatelessWidget {
  final IconData icon;
  final String title;
  final int index;
  final int? groupValue;
  final ValueChanged<int?> onChanged;

  const PaymentOptionWdgt({
    super.key,
    required this.icon,
    required this.title,
    required this.index,
    this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainerWdt(
      
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, size: 32),
        title: Text(title),
        trailing: Radio<int>(
          value: index,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: Colors.orange,
          fillColor: MaterialStateProperty.resolveWith<Color>((
            Set<MaterialState> states,
          ) {
            if (states.contains(MaterialState.selected)) {
              return Colors.orange;
            }
            return Colors.orange;
          }),
        ),
        onTap: () => onChanged(index),
      ),
    );
  }
}