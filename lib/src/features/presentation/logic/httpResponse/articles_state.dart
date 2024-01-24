part of 'articles_bloc.dart';

abstract class ArticlesState extends Equatable {
  const ArticlesState();
}

final class ArticlesInitial extends ArticlesState {
  @override
  List<Object> get props => [];
}

final class ArticlesLoading extends ArticlesState {
  @override
  List<Object> get props => [];
}

final class ArticlesSuccess extends ArticlesState {
  final List<ArticleEntity> articles;

  const ArticlesSuccess({required this.articles});
  @override
  List<Object> get props => [articles];
}

final class ArticlesFailure extends ArticlesState {
  final String error;

  const ArticlesFailure({required this.error});
  @override
  List<Object> get props => [error];
}
