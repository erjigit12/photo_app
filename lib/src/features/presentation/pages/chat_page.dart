import 'package:flutter/material.dart';
import 'package:photos_app/src/config/config.dart';
import 'package:photos_app/src/core/routes/page_names.dart';
import 'package:photos_app/src/features/presentation/widgets/widgets.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text(
          'Chat',
          style: AppTextStyle.f17w600,
        ),
        foregroundColor: AppColors.blackColor,
        centerTitle: true,
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return MemberCardWidget(
            onTap: () {
              Navigator.pushNamed(context, PageNames.singleChatPage);
            },
          );
        },
      ),
    );
  }
}
