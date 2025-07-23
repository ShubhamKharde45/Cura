import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    this.height,
    required this.width,
    this.child,
    this.margine,
    this.padding,
  });

  final double? height;
  final double width;
  final EdgeInsetsGeometry? margine;
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: margine,
      padding: padding,
      width: width,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 239, 244, 253),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black.withOpacity(0.3), width: 0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 15,
            spreadRadius: 2,
            offset: Offset(5, 5),
          ),
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 15,
            spreadRadius: 2,
            offset: Offset(-5, -5),
          ),
        ],
      ),
      child: child,
    );
  }
}
