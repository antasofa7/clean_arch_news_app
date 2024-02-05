import 'package:floor/floor.dart';

import '../../domain/entities/article.dart';

@Entity(tableName: 'article', primaryKeys: ['id'])
class ArticleModel extends ArticleEntity {
  const ArticleModel(
      {int? id,
      String? author,
      String? title,
      String? description,
      String? url,
      String? urlToImage,
      String? publishedAt,
      String? content})
      : super(
            id: id,
            author: author,
            title: title,
            description: description,
            url: url,
            urlToImage: urlToImage,
            publishedAt: publishedAt,
            content: content);

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        author: json['author'] ?? '',
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        url: json['url'] ?? '',
        urlToImage: json['urlToImage'] ?? '',
        publishedAt: json['publishedAt'] ?? '',
        content: json['content'] ?? '',
      );

  factory ArticleModel.fromEntity(ArticleEntity entity) => ArticleModel(
        id: entity.id,
        author: entity.author,
        title: entity.title,
        description: entity.description,
        url: entity.url,
        urlToImage: entity.urlToImage,
        publishedAt: entity.publishedAt,
        content: entity.content,
      );
}
