// import 'dart:io';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:photos_app/src/core/resources/data_state.dart';
// import 'package:photos_app/src/features/domain/usecases/article/article_use_case.dart';

// part 'remote_article_state.dart';

// class RemoteArticleCubit extends Cubit<RemoteArticleState> {
//   final ArticlesUseCase articlesUseCase;
//   RemoteArticleCubit({required this.articlesUseCase})
//       : super(RemoteArticleInitial());

//   Future<dynamic> getArticles() async {
//     try {
//       emit(RemoteArticleLoading());
//       final data = await articlesUseCase;
//       if (data is DataSuccess) {}
//     } on SocketException catch (_) {
//       emit(RemoteArticleFailure());
//     } catch (_) {
//       emit(RemoteArticleFailure());
//     }
//   }
// }
