import 'package:flutter/material.dart';
import 'package:photos_app/src/config/config.dart';
import 'package:photos_app/src/core/routes/page_names.dart';
import 'package:photos_app/src/features/presentation/widgets/widgets.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/splash.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              'assets/icons/red_forward.png',
                              width: 38,
                              height: 38,
                            ),
                            Image.asset(
                              'assets/icons/black_forward.png',
                              width: 38,
                              height: 38,
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Text(
                          'photo',
                          style: AppTextStyle.f48w400,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LoggedoutButtonWidget(
                    text: 'LOG IN',
                    backgoundColor: Colors.white,
                    textColor: Colors.black,
                    onPressed: () {
                      Navigator.pushNamed(context, PageNames.loginPage);
                    },
                  ),
                  LoggedoutButtonWidget(
                    text: 'REGISTER',
                    backgoundColor: Colors.black,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(context, PageNames.registerPage);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
