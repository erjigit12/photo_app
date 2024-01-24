import 'package:photos_app/src/features/domain/entities/article_entity.dart';

abstract class ArticlesRemoteDataSource {
  // Api method
  // Future<DataState<List<ArticleModel>>> getNewsArticles();
  Future<List<ArticleEntity>> getArticles();
}
