import 'package:photos_app/src/features/domain/entities/article_entity.dart';
import 'package:photos_app/src/features/domain/repositories/article_repository.dart';

class ArticlesUseCase {
  final ArticleRepository articleRepository;

  ArticlesUseCase({required this.articleRepository});

  Future<List<ArticleEntity>> getArticles() async {
    return articleRepository.getArticles();
  }
}
