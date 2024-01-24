import 'package:photos_app/src/features/domain/entities/user_entity.dart';

abstract class FirebaseRepository {
  //
  // Credential section
  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<bool> isSignIn();
  Future<void> signOut();
  Future<void> forgotPassword(String email);
  Future<void> googleAuth();
  Future<void> getUpdateUser(UserEntity user);
  Future<void> getCreateCurrentUser(UserEntity user);
  Future<String> getCurrentUserId();
  Stream<List<UserEntity>> getAllUsers();
}
