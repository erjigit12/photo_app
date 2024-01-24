// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:photos_app/src/core/constants/apis.dart';
// import 'package:photos_app/src/core/resources/data_state.dart';
// import 'package:photos_app/src/features/data/models/article_model.dart';
// import 'package:photos_app/src/features/domain/repositories/article_repository.dart';

// class ArticleRepositoryImpl extends ArticleRepository {
//   // final ArticleRemoteDataSource articleRemoteDataSource;

//   // ArticleRepositoryImpl({required this.articleRemoteDataSource});

//   @override
//   Future<DataState<List<ArticleModel>>> getNewsArticles() async {
//     try {
//       final httpResponse = await _newsApiService.getNewsArticles(
//         apiKey: newsAPIKey,
//         country: "countryQuery",
//         category: "categoryQuery",
//       );

//       if (httpResponse.response.statusCode == HttpStatus.ok) {
//         return DataSuccess(httpResponse.data);
//       } else {
//         return DataFailed(DioError(
//             error: httpResponse.response.statusMessage,
//             response: httpResponse.response,
//             type: DioErrorType.badResponse,
//             requestOptions: httpResponse.response.requestOptions));
//       }
//     } on DioError catch (e) {
//       return DataFailed(e);
//     }
//   }
// }

import 'package:photos_app/src/features/data/datasources/remote_data_source/article/article_remote_data_source.dart';
import 'package:photos_app/src/features/domain/entities/article_entity.dart';
import 'package:photos_app/src/features/domain/repositories/article_repository.dart';

class ArticlesRepositoryImpl extends ArticleRepository {
  final ArticlesRemoteDataSource articlesRemoteDataSource;

  ArticlesRepositoryImpl({required this.articlesRemoteDataSource});

  @override
  Future<List<ArticleEntity>> getArticles() async =>
      await articlesRemoteDataSource.getArticles();
}
