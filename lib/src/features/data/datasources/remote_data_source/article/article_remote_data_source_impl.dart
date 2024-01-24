import 'dart:convert';

import 'package:http/http.dart';
import 'package:photos_app/src/core/constants/apis.dart';
import 'package:photos_app/src/features/data/datasources/remote_data_source/article/article_remote_data_source.dart';
import 'package:photos_app/src/features/data/models/article_model.dart';
import 'package:photos_app/src/features/domain/entities/article_entity.dart';

class ArticlesRemoteDataSourceImpl extends ArticlesRemoteDataSource {
  @override
  Future<List<ArticleEntity>> getArticles() async {
    Response response = await get(Uri.parse(newsAPIBaseURL));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => ArticleModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
  // List<ArticleModel> photos = [];
  // @override
  // Future<List<ArticleEntity>> getArticles() async {
  //   Dio dio = Dio();
  //   dio.options.headers['content-Type'] = 'application/json';
  //   var response = await dio.get(newsAPIBaseURL,
  //       options: Options(responseType: ResponseType.json, method: "Get"));

  //   if (response.statusCode == 200) {
  //     return response.data.forEach((elm) {
  //       photos.add(ArticleModel.fromJson(elm));
  //     });
  //   } else {
  //     return response.data;
  //   }
  // }
}
