import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/article.dart';
import '../../../../domain/usecases/get_saved_article.dart';
import '../../../../domain/usecases/remove_article.dart';
import '../../../../domain/usecases/save_article.dart';

part 'local_article_event.dart';
part 'local_article_state.dart';

class LocalArticlesBloc extends Bloc<LocalArticlesEvent, LocalArticlesState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArtcleUseCase;

  LocalArticlesBloc(this._getSavedArticleUseCase, this._saveArticleUseCase,
      this._removeArtcleUseCase)
      : super(LocalArticlesLoading()) {
    on<GetSavedArticles>(onGetSavedArticles);
    on<SaveArticle>(onSaveArticle);
    on<RemoveArticle>(onRemoveArticle);
  }

  void onGetSavedArticles(
      GetSavedArticles event, Emitter<LocalArticlesState> emit) async {
    final articles = await _getSavedArticleUseCase();

    emit(LocalArticlesDone(articles));
  }

  void onSaveArticle(
      SaveArticle event, Emitter<LocalArticlesState> emit) async {
    await _saveArticleUseCase(params: event.article);

    final articles = await _getSavedArticleUseCase();

    print(articles);

    emit(LocalArticlesDone(articles));
  }

  void onRemoveArticle(
      RemoveArticle event, Emitter<LocalArticlesState> emit) async {
    await _removeArtcleUseCase(params: event.article);

    final articles = await _getSavedArticleUseCase();

    emit(LocalArticlesDone(articles));
  }
}
