import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IOSAppBar extends AppBar {
  IOSAppBar({
    super.key,
    super.title,
    required BuildContext context,
    Widget? leading,
    bool centerTitle = true,
  }) : super(
          leading: leading ,
          centerTitle: centerTitle,
          scrolledUnderElevation: 0,
          elevation: 0,
        );
}