import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  final bool obscureText;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final TextInputType keyboardType;

  const CustomTextfield({
    super.key,
    required this.controller,
    required this.labelText,
    this.prefixIcon,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.onSuffixIconPressed,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  color: theme.colorScheme.primary,
                )
              : null,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  icon: Icon(
                    suffixIcon,
                    color: theme.colorScheme.primary,
                  ),
                  onPressed: onSuffixIconPressed,
                )
              : null,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          filled: true,
          fillColor: theme.colorScheme.surfaceVariant.withOpacity(0.5),
          labelStyle: TextStyle(color: theme.colorScheme.onSurface),
        ),
        validator: validator,
      ),
    );
  }
}
