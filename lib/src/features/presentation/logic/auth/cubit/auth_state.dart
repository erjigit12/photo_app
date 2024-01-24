part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

final class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

final class AuthenticatedState extends AuthState {
  const AuthenticatedState({required this.uid});

  final String uid;

  @override
  List<Object?> get props => [uid];
}

final class UnAuthenticatedState extends AuthState {
  @override
  List<Object?> get props => [];
}
