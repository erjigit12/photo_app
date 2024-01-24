import 'package:flutter/material.dart';
import 'package:photos_app/src/config/config.dart';

class OpenPhotoPage extends StatelessWidget {
  const OpenPhotoPage({Key? key, required this.images}) : super(key: key);

  final String images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(images),
              fit: BoxFit.cover,
            ),
          ),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/splash.png',
              ),
            ),
            title: Text(
              'Ridhwan Nordin',
              style: AppTextStyle.f13w700,
            ),
            subtitle: Text(
              '@ridzjcob',
              style: AppTextStyle.f11w400,
            ),
            trailing: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close),
            ),
          ),
        ),
      ),
    );
  }
}
