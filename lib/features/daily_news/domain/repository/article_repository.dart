import '../../../../core/resources/data_state.dart';
import '../entities/article.dart';

abstract class ArticleRepository {
  // API methods
  Future<DataSet<List<ArticleEntity>>> getNewsArticles();

  // Database methods
  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> saveArticle(ArticleEntity article);

  Future<void> removeArticle(ArticleEntity article);
}
