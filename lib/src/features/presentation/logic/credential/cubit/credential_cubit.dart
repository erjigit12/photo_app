import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos_app/src/features/domain/entities/user_entity.dart';
import 'package:photos_app/src/features/domain/usecases/credential/forgot_password_usecase.dart';
import 'package:photos_app/src/features/domain/usecases/credential/get_create_current_user_usecase.dart';
import 'package:photos_app/src/features/domain/usecases/credential/google_auth_usecase.dart';
import 'package:photos_app/src/features/domain/usecases/credential/sign_in_usecase.dart';
import 'package:photos_app/src/features/domain/usecases/credential/sign_up_usecase.dart';

part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SignUpUseCase signUpUseCase;
  final SignInUseCase signInUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final GetCreateCurrentUserUseCase getCreateCurrentUserUseCase;
  final GoogleAuthUseCase googleAuthUseCase;

  CredentialCubit({
    required this.signUpUseCase,
    required this.signInUseCase,
    required this.forgotPasswordUseCase,
    required this.getCreateCurrentUserUseCase,
    required this.googleAuthUseCase,
  }) : super(CredentialInitial());

  Future<void> submitSignIn({required UserEntity user}) async {
    emit(CredentialLoading());
    try {
      await signInUseCase.signIn(user);
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> submitSignUp({required UserEntity user}) async {
    emit(CredentialLoading());
    try {
      await signUpUseCase.signUp(user);
      // getCreateCurrentUserUseCase.getCreateCurrentUser(user);
      await getCreateCurrentUserUseCase.getCreateCurrentUser(user);
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> submitGoogleAuth({required UserEntity user}) async {
    try {
      googleAuthUseCase.googleAuth();
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> forgotPassword({required UserEntity user}) async {
    try {
      forgotPasswordUseCase.forgotPassword(user.email!);
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }
}
