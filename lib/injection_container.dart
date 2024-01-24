import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:photos_app/src/features/data/datasources/remote_data_source/article/article_remote_data_source.dart';
import 'package:photos_app/src/features/data/datasources/remote_data_source/article/article_remote_data_source_impl.dart';
import 'package:photos_app/src/features/data/repositories/article_repository_impl.dart';
import 'package:photos_app/src/features/domain/repositories/article_repository.dart';
import 'package:photos_app/src/features/domain/usecases/article/article_use_case.dart';
import 'package:photos_app/src/features/features.dart';
import 'package:photos_app/src/features/data/datasources/remote_data_source/firebase/firebase_remote_data_source.dart';
import 'package:photos_app/src/features/data/datasources/remote_data_source/firebase/firebase_remote_data_source_impl.dart';
import 'package:photos_app/src/features/data/repositories/firebase_repository_impl.dart';
import 'package:photos_app/src/features/domain/repositories/firebase_repository.dart';
import 'package:photos_app/src/features/domain/usecases/credential/forgot_password_usecase.dart';
import 'package:photos_app/src/features/domain/usecases/credential/get_all_users_usecase.dart';
import 'package:photos_app/src/features/domain/usecases/credential/get_create_current_user_usecase.dart';
import 'package:photos_app/src/features/domain/usecases/auth/get_current_user_id_usecase.dart';
import 'package:photos_app/src/features/domain/usecases/credential/get_update_user_usecase.dart';
import 'package:photos_app/src/features/domain/usecases/credential/google_auth_usecase.dart';
import 'package:photos_app/src/features/domain/usecases/auth/is_sign_in_usecase.dart';
import 'package:photos_app/src/features/domain/usecases/credential/sign_in_usecase.dart';
import 'package:photos_app/src/features/domain/usecases/auth/sign_out_usecase.dart';
import 'package:photos_app/src/features/domain/usecases/credential/sign_up_usecase.dart';
import 'package:photos_app/src/features/presentation/logic/httpResponse/articles_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // bloc or cubit
  sl.registerFactory<MainCubit>(() => MainCubit());

  sl.registerFactory<AuthCubit>(() => AuthCubit(
        isSignInUseCase: sl.call(),
        getCurrentUserIdUseCase: sl.call(),
        signOutUseCase: sl.call(),
      ));

  sl.registerFactory<CredentialCubit>(() => CredentialCubit(
        signUpUseCase: sl.call(),
        signInUseCase: sl.call(),
        forgotPasswordUseCase: sl.call(),
        getCreateCurrentUserUseCase: sl.call(),
        googleAuthUseCase: sl.call(),
      ));

  sl.registerFactory<UserCubit>(() => UserCubit(
        getAllUsersUseCase: sl.call(),
        getUpdateUserUseCase: sl.call(),
      ));

  sl.registerFactory<ArticlesBloc>(() => ArticlesBloc(
        articlesUseCase: sl.call(),
      ));

  // UseCase
  // AuthCubit UseCase
  sl.registerLazySingleton<GetCurrentUserIdUseCase>(
      () => GetCurrentUserIdUseCase(repository: sl.call()));
  sl.registerLazySingleton<IsSignInUseCase>(
      () => IsSignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetAllUsersUseCase>(
      () => GetAllUsersUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetUpdateUserUseCase>(
      () => GetUpdateUserUseCase(repository: sl.call()));

  // Credential UseCase
  sl.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(repository: sl.call()));
  sl.registerLazySingleton<ForgotPasswordUseCase>(
      () => ForgotPasswordUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCreateCurrentUserUseCase>(
      () => GetCreateCurrentUserUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => GoogleAuthUseCase(repository: sl.call()));

  // Articles UseCase
  sl.registerLazySingleton(() => ArticlesUseCase(articleRepository: sl.call()));

  // Repository
  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(remoteDataSource: sl.call()));
  sl.registerLazySingleton<ArticleRepository>(
      () => ArticlesRepositoryImpl(articlesRemoteDataSource: sl.call()));

  // Remote DataSource
  sl.registerLazySingleton<FirebaseRemoteDataSource>(() =>
      FirebaseRemoteDataSourceImpl(firestore: sl.call(), auth: sl.call()));
  sl.registerLazySingleton<ArticlesRemoteDataSource>(
      () => ArticlesRemoteDataSourceImpl());

  // LocalSource

  // External
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  // final googleSignIn = GoogleSignIn();

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
  // sl.registerLazySingleton(() => fireStore);
}
