import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos_app/src/config/widgets/widget.dart';
import 'package:photos_app/src/features/features.dart';
import 'package:photos_app/src/features/domain/entities/user_entity.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
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
            log('Invalid Email;');
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
          const LargeTextWidget(text: 'Register'),
          const SizedBox(height: 32),
          TextFieldWidget(
            controller: _nameController,
            hintText: 'name',
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 16),
          TextFieldWidget(
            controller: _emailController,
            hintText: 'email',
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          TextFieldWidget(
            controller: _passwordController,
            hintText: 'password',
            textInputType: TextInputType.visiblePassword,
            obscure: true,
          ),
          const SizedBox(height: 16),
          ButtonBlackBackground(
            text: 'NEXT',
            onTap: () {
              _submitSignUp();
              // Navigator.pushNamed(context, RoutesName.registerNamePage);
            },
          ),
        ],
      ),
    );
  }

  void _submitSignUp() {
    if (_nameController.text.isEmpty) {
      // Toast(...msg = "enter your email");
      return;
    }

    if (_emailController.text.isEmpty) {
      // Toast(...msg = "enter your email");
      return;
    }

    if (_passwordController.text.isEmpty) {
      // Toast(...msg = "enter your password");
      return;
    }

    BlocProvider.of<CredentialCubit>(context).submitSignUp(
        user: UserEntity(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      isOnline: false,
      phoneNumber: "",
      profileUrl: "",
    ));
  }
}
