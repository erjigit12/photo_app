import 'package:flutter/material.dart';
import 'package:photos_app/src/config/widgets/widget.dart';
import 'package:photos_app/src/features/presentation/widgets/widgets.dart';

class NameRegisterPage extends StatelessWidget {
  const NameRegisterPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LargeTextWidget(text: 'Register'),
            const SizedBox(height: 32),
            const TextFieldWidget(
              hintText: 'name',
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            ButtonBlackBackground(
              text: 'SIGN UP',
              onTap: () {
                // Navigator.pushNamed(context, RoutesName.loginPage);
              },
            ),
            const SizedBox(height: 32),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'By signing up, you agree to Photo’s '),
                  TextSpan(
                    text: 'Terms of Service ',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                  TextSpan(text: 'and'),
                  TextSpan(
                    text: '\nPrivacy Policy.',
                    style: TextStyle(decoration: TextDecoration.underline),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
