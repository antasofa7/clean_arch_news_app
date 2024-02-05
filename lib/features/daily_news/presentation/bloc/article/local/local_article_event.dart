part of 'local_article_bloc.dart';

abstract class LocalArticlesEvent extends Equatable {
  final ArticleEntity? article;

  const LocalArticlesEvent({this.article});

  @override
  List<Object?> get props => [article];
}

class GetSavedArticles extends LocalArticlesEvent {
  const GetSavedArticles();
}

class SaveArticle extends LocalArticlesEvent {
  const SaveArticle(ArticleEntity article) : super(article: article);
}

class RemoveArticle extends LocalArticlesEvent {
  const RemoveArticle(ArticleEntity article) : super(article: article);
}
