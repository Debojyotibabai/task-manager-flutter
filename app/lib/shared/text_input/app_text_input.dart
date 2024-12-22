import 'package:flutter/material.dart';

class AppTextInput extends StatelessWidget {
  const AppTextInput({
    super.key,
    required this.controller,
    required this.hintText,
    this.backgroundColor = Colors.white,
    this.width = double.infinity,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.enabled = true,
    this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final Color? backgroundColor;
  final double? width;
  final bool? obscureText;
  final TextInputType keyboardType;
  final bool? enabled;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText!,
        keyboardType: keyboardType,
        enabled: enabled!,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
          color: Colors.black,
          fontSize: 19,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: backgroundColor,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black38,
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
          errorStyle: TextStyle(
            color: Colors.red,
            fontSize: 16.5,
          ),
          contentPadding: const EdgeInsets.all(20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey.shade300,
              width: 2.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey.shade300,
              width: 2.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.black,
              width: 2.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.red.shade100,
              width: 2.5,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.red.shade300,
              width: 2.5,
            ),
          ),
        ),
        validator: validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return "$hintText is required".toLowerCase();
              }
              return null;
            },
      ),
    );
  }
}
