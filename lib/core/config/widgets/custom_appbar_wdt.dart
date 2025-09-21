import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IOSAppBar extends AppBar {
  IOSAppBar({
    super.key,
    super.title,
    required BuildContext context,
    Widget? leading,
  }) : super(
          leading: leading,
        );
}