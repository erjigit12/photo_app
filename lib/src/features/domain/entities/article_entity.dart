import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  const ArticleEntity({
    this.id,
    this.createdAt,
    this.color,
    this.urls,
  });

  final String? id;
  final String? createdAt;
  final String? color;
  final Map<String, dynamic>? urls;

  @override
  List<Object?> get props => [id, createdAt, color, urls];
}
