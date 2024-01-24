import 'package:photos_app/src/features/domain/entities/user_entity.dart';
import 'package:photos_app/src/features/domain/repositories/firebase_repository.dart';

class GetCreateCurrentUserUseCase {
  final FirebaseRepository repository;

  GetCreateCurrentUserUseCase({required this.repository});

  Future<void> getCreateCurrentUser(UserEntity user) {
    return repository.getCreateCurrentUser(user);
  }
}
