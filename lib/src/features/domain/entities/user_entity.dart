import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
    this.isOnline,
    this.uid,
    this.profileUrl,
    this.dob,
    this.gender,
  });

  final String? name;
  final String? email;
  final String? password;
  final String? phoneNumber;
  final bool? isOnline;
  final String? uid;
  final String? profileUrl;
  final String? dob;
  final String? gender;

  @override
  List<Object?> get props => [
        name,
        email,
        password,
        phoneNumber,
        isOnline,
        uid,
        profileUrl,
        dob,
        gender,
      ];
}
