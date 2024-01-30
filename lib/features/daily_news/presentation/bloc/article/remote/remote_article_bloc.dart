import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:new_app_clean_arch/core/resources/data_state.dart';

import '../../../../domain/entities/article.dart';
import '../../../../domain/usecases/get_article.dart';

part 'remote_article_event.dart';
part 'remote_article_state.dart';

class RemoteArticlesBloc
    extends Bloc<RemoteArticlesEvent, RemoteArticlesState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticlesBloc(this._getArticleUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  Future<void> onGetArticles(
      GetArticles event, Emitter<RemoteArticlesState> emit) async {
    final dataSet = await _getArticleUseCase();

    if (dataSet is DataSuccess && dataSet.data!.isNotEmpty) {
      // print('respponse: ${dataSet.data}');
      emit(RemoteArticlesDone(dataSet.data!));
    }

    if (dataSet is DataFailed) {
      emit(RemoteArticlesError(dataSet.error!));
    }
  }
}
