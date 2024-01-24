import 'package:flutter/material.dart';

class LoggedoutButtonWidget extends StatelessWidget {
  const LoggedoutButtonWidget({
    super.key,
    required this.text,
    required this.backgoundColor,
    required this.textColor,
    this.onPressed,
  });

  final String text;
  final Color backgoundColor;
  final Color textColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(167, 52),
        side: const BorderSide(width: 2, color: Colors.black),
        backgroundColor: backgoundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 13,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.52,
        ),
      ),
    );
  }
}
