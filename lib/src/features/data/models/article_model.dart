import 'package:photos_app/src/features/domain/entities/article_entity.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    final String? id,
    final String? createdAt,
    final String? color,
    final Map<String, dynamic>? urls,
  }) : super(
          id: id,
          createdAt: createdAt,
          color: color,
          urls: urls,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      id: map['id'],
      createdAt: map['createdAt'],
      color: map['color'],
      urls: map['urls'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "createdAt": createdAt,
      "color": color,
      "urls": urls,
    };
  }
}
