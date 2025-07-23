import 'package:cura/utils/app_container.dart';
import 'package:flutter/material.dart';

class AppInputField extends StatelessWidget {
  const AppInputField({super.key, required this.hint, this.controller});

  final String hint;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      width: MediaQuery.of(context).size.width,
      child: TextField(
        controller: controller,
        
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
