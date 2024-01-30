import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/article.dart';
import '../repository/article_repository.dart';

class GetArticleUseCase implements UseCase<DataSet<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);
  @override
  Future<DataSet<List<ArticleEntity>>> call({void params}) =>
      _articleRepository.getNewsArticles();
}
