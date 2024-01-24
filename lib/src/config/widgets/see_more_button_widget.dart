import 'package:flutter/material.dart';
import 'package:photos_app/src/config/config.dart';

class SeeMoreButtonWidget extends StatelessWidget {
  const SeeMoreButtonWidget({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(width: 2, color: Colors.black),
        ),
        child: Text(
          'See more'.toUpperCase(),
          style: AppTextStyle.f13w900cBlack,
        ),
      ),
    );
  }
}
