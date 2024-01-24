part of 'articles_bloc.dart';

abstract class ArticlesEvent extends Equatable {
  const ArticlesEvent();
}

class GetArticlesEvent extends ArticlesEvent {
  @override
  List<Object> get props => [];
}
