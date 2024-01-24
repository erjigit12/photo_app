import 'package:photos_app/src/features/domain/repositories/firebase_repository.dart';

class GetCurrentUserIdUseCase {
  final FirebaseRepository repository;

  GetCurrentUserIdUseCase({required this.repository});

  Future<String> call() {
    return repository.getCurrentUserId();
  }
}
