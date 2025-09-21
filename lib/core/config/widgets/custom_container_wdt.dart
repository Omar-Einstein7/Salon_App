import 'package:flutter/material.dart';

class CustomContainerWdt extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final Decoration? decoration;

  const CustomContainerWdt({
    Key? key,
    this.child,
    this.width,
    this.height,
    this.color,
    this.padding,
    this.margin,
    this.borderRadius,
    this.border,
    this.boxShadow,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: decoration ?? BoxDecoration(
        color: color ?? Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(20),
        border: border,
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}
