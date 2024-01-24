import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos_app/src/features/domain/entities/article_entity.dart';
import 'package:photos_app/src/features/domain/usecases/article/article_use_case.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final ArticlesUseCase articlesUseCase;
  ArticlesBloc({required this.articlesUseCase}) : super(ArticlesInitial()) {
    on<GetArticlesEvent>((event, emit) async {
      emit(ArticlesLoading());
      log('FIRST state');
      try {
        final articles = await articlesUseCase.getArticles();
        emit(ArticlesSuccess(articles: articles));
      } catch (e) {
        emit(ArticlesFailure(error: e.toString()));
      }
    });
  }
}
