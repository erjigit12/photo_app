import 'package:photos_app/src/features/domain/entities/article_entity.dart';

abstract class ArticleRepository {
  // Api method
  Future<List<ArticleEntity>> getArticles();
}
