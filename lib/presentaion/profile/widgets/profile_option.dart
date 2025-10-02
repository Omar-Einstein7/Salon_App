import 'package:flutter/material.dart';

class ProfileOptionTile extends StatelessWidget {
  final IconData? icon;
  final Color? color;
  final String title;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Color? textColor;

  const ProfileOptionTile({
    super.key,
    this.icon,
      this.color,
    required this.title,
    this.onTap,
    this.trailing,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon != null ? Icon(icon , color: color,) : null,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: textColor,
        ),
      ),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}