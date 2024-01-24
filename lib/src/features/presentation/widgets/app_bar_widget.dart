import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.reply),
      ),
      elevation: 0,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white.withOpacity(0.1),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 80);
}
