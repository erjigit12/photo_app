import 'package:photos_app/src/features/domain/entities/user_entity.dart';
import 'package:photos_app/src/features/domain/repositories/firebase_repository.dart';

class GetUpdateUserUseCase {
  final FirebaseRepository repository;

  GetUpdateUserUseCase({required this.repository});

  Future<void> call(UserEntity user) {
    return repository.getUpdateUser(user);
  }
}
