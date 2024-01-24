import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.hintText,
    this.textInputType,
    this.obscure = false,
    this.controller,
  });

  final String hintText;
  final TextInputType? textInputType;
  final bool obscure;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.black),
      ),
      child: TextField(
        keyboardType: textInputType,
        controller: controller,
        decoration: InputDecoration(
          prefix: const Text("    "),
          border: InputBorder.none,
          hintText: hintText,
        ),
        obscureText: obscure,
      ),
    );
  }
}
