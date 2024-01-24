import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos_app/src/features/domain/entities/user_entity.dart';
import 'package:photos_app/src/features/domain/usecases/credential/get_all_users_usecase.dart';
import 'package:photos_app/src/features/domain/usecases/credential/get_update_user_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetAllUsersUseCase getAllUsersUseCase;
  final GetUpdateUserUseCase getUpdateUserUseCase;
  UserCubit({
    required this.getAllUsersUseCase,
    required this.getUpdateUserUseCase,
  }) : super(UserInitial());

  Future<void> getUsers() async {
    try {
      getAllUsersUseCase.call().listen((listUsers) {
        emit(UserSuccess(users: listUsers));
      });
    } on SocketException catch (_) {
      emit(UserFailure());
    } catch (_) {
      emit(UserFailure());
    }
  }

  Future<void> updateUser({required UserEntity user}) async {
    try {
      getUpdateUserUseCase.call(user);
    } on SocketException catch (_) {
      emit(UserFailure());
    } catch (_) {
      emit(UserFailure());
    }
  }
}
