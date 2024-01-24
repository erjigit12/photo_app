import 'package:photos_app/src/features/domain/repositories/firebase_repository.dart';

class ForgotPasswordUseCase {
  final FirebaseRepository repository;

  ForgotPasswordUseCase({required this.repository});

  Future<void> forgotPassword(String email) {
    return repository.forgotPassword(email);
  }
}
