part of 'local_article_bloc.dart';

abstract class LocalArticlesState extends Equatable {
  final List<ArticleEntity>? article;

  const LocalArticlesState({this.article});

  @override
  List<Object?> get props => [article];
}

class LocalArticlesLoading extends LocalArticlesState {}

class LocalArticlesDone extends LocalArticlesState {
  const LocalArticlesDone(List<ArticleEntity> articles)
      : super(article: articles);
}
