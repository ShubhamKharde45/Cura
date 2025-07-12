import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    this.height,
    required this.width,
    required this.child,
    this.padding,
    this.color,
  });

  final double? height;
  final double width;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color ?? Colors.grey.shade900,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade600, width: 0.8),
      ),
      child: child,
    );
  }
}

class AppColorContainer extends StatelessWidget {
  const AppColorContainer({
    super.key,
    this.height,
    required this.width,
    required this.child,
    this.color,
  });

  final double? height;
  final double width;
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color ?? Colors.green.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
