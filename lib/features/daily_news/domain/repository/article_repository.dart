import '../../../../core/resources/data_state.dart';
import '../entities/article.dart';

abstract class ArticleRepository {
  Future<DataSet<List<ArticleEntity>>> getNewsArticles();
}
