// ignore_for_file: prefer_collection_literals

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:photos_app/src/features/data/datasources/remote_data_source/firebase/firebase_remote_data_source.dart';
import 'package:photos_app/src/features/data/models/user_model.dart';
import 'package:photos_app/src/features/domain/entities/user_entity.dart';

class FirebaseRemoteDataSourceImpl extends FirebaseRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  FirebaseRemoteDataSourceImpl({required this.firestore, required this.auth});

  @override
  Future<void> forgotPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async {
    final userCollection = firestore.collection("users");

    final uid = await getCurrentUserId();
    // await userManage.setUid(uid);

    userCollection.doc(uid).get().then((userDoc) {
      final newUser = UserModel(
        name: user.name,
        email: user.email,
        phoneNumber: user.phoneNumber,
        isOnline: user.isOnline,
        uid: uid,
        profileUrl: user.profileUrl,
        // dob: user.dob,
        // gender: user.gender,
      ).toJson();

      if (!userDoc.exists) {
        userCollection.doc(uid).set(newUser);
      }

      return;
    });
  }

  @override
  Future<String> getCurrentUserId() async => auth.currentUser!.uid;

  @override
  Future<void> getUpdateUser(UserEntity user) async {
    Map<String, dynamic> userInformation = Map();
    final userCollection = firestore.collection("users");

    if (user.profileUrl != null && user.profileUrl != "") {
      userInformation['profileUrl'] = user.profileUrl;
    }

    if (user.name != null && user.name != "") {
      userInformation['name'] = user.name;
    }

    userCollection.doc(user.uid).update(userInformation);
  }

  @override
  Future<void> googleAuth() {
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignIn() async => auth.currentUser?.uid != null;

  @override
  Future<void> signIn(UserEntity user) async {
    await auth.signInWithEmailAndPassword(
      email: user.email!,
      password: user.password!,
    );
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
    // await userManage.removeUid();
  }

  @override
  Future<void> signUp(UserEntity user) async {
    await auth.createUserWithEmailAndPassword(
      email: user.email!,
      password: user.password!,
    );
  }

  @override
  Stream<List<UserEntity>> getAllUsers() {
    final userCollection = firestore.collection("users");

    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => UserModel.fromJson(e)).toList());
  }
}
