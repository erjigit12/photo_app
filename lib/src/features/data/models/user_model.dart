import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:photos_app/src/features/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    final String? name,
    final String? email,
    final String? password,
    final String? phoneNumber,
    final bool? isOnline,
    final String? uid,
    final String? profileUrl,
    final String? dob,
    final String? gender,
  }) : super(
          name: name,
          email: email,
          password: password,
          phoneNumber: phoneNumber,
          isOnline: isOnline,
          uid: uid,
          profileUrl: profileUrl,
          dob: dob,
          gender: gender,
        );

  factory UserModel.fromJson(DocumentSnapshot snapshot) {
    return UserModel(
      name: snapshot.get('name'),
      email: snapshot.get('email'),
      phoneNumber: snapshot.get('phoneNumber'),
      isOnline: snapshot.get('isOnline'),
      uid: snapshot.get('uid'),
      profileUrl: snapshot.get('profileUrl'),
      dob: snapshot.get('dob'),
      gender: snapshot.get('gender'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "isOnline": isOnline,
      "uid": uid,
      "profileUrl": profileUrl,
      "dob": dob,
      "gender": gender,
    };
  }
}
