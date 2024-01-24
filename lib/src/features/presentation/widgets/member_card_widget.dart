import 'package:flutter/material.dart';
import 'package:photos_app/src/config/config.dart';

class MemberCardWidget extends StatelessWidget {
  const MemberCardWidget({Key? key, this.onTap}) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade500,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Text('Title', style: AppTextStyle.f13w700),
                      const SizedBox(height: 5),
                      Text('Subtitle', style: AppTextStyle.f13w400),
                    ],
                  ),
                ],
              ),
            ),
            Divider(thickness: 1, color: AppColors.blackColor.withOpacity(0.3)),
          ],
        ),
      ),
    );
  }
}
