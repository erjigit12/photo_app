import 'package:flutter/material.dart';
import 'package:photos_app/src/config/config.dart';

class LargeTextWidget extends StatelessWidget {
  const LargeTextWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyle.f36w400,
    );
  }
}
