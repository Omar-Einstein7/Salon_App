import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String txt;
  final void Function()? onPressed;

  const CustomButton({
    super.key,
    required this.txt,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.orange),
        minimumSize: WidgetStateProperty.all(const Size(double.infinity, 45)),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(vertical: 16),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        elevation: WidgetStateProperty.all(2),
      ),
      child: Text(
        txt,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
          color: Colors.white,
        ),
      ),
    );
  }
}
