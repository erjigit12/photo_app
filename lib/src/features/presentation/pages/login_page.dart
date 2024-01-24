import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos_app/src/config/widgets/widget.dart';
import 'package:photos_app/src/features/features.dart';
import 'package:photos_app/src/features/domain/entities/user_entity.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: BlocConsumer<CredentialCubit, CredentialState>(
        listener: (context, cretentialState) {
          if (cretentialState is CredentialSuccess) {
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }
          if (cretentialState is CredentialFailure) {
            log('Invalid Email Password');
          }
        },
        builder: (context, cretentialState) {
          if (cretentialState is CredentialLoading) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: CircularProgressIndicator()),
              ],
            );
          }
          if (cretentialState is CredentialSuccess) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is AuthenticatedState) {
                  return MainView(uid: authState.uid);
                } else {
                  return _bodyWidget();
                }
              },
            );
          }
          return _bodyWidget();
        },
      ),
    );
  }

  _bodyWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LargeTextWidget(text: 'Log in'),
          const SizedBox(height: 32),
          TextFieldWidget(
            controller: _emailController,
            hintText: 'email',
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          TextFieldWidget(
            controller: _passwordController,
            hintText: 'password',
            textInputType: TextInputType.emailAddress,
            obscure: true,
          ),
          const SizedBox(height: 16),
          ButtonBlackBackground(
            text: 'LOG IN',
            onTap: () {
              _submitSignIn();
              // Navigator.pushNamedAndRemoveUntil(
              //     context, RoutesName.mainPage, (route) => false);
            },
          ),
        ],
      ),
    );
  }

  void _submitSignIn() {
    if (_emailController.text.isEmpty) {
      /// enter you email;
      return;
    }

    if (_emailController.text.isEmpty) {
      /// enter you password;
      return;
    }

    BlocProvider.of<CredentialCubit>(context).submitSignIn(
        user: UserEntity(
      email: _emailController.text,
      password: _passwordController.text,
    ));
  }
}
