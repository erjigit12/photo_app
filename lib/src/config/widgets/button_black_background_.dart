import 'package:flutter/material.dart';
import 'package:photos_app/src/config/config.dart';

class ButtonBlackBackground extends StatelessWidget {
  const ButtonBlackBackground({
    super.key,
    required this.text,
    this.onTap,
  });

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 52,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AppColors.blackColor,
        ),
        child: Text(
          text,
          style: AppTextStyle.f13w900cWhite,
        ),
      ),
    );
  }
}
