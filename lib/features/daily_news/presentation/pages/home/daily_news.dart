import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:new_app_clean_arch/features/daily_news/domain/entities/article.dart';

import '../../bloc/article/remote/remote_article_bloc.dart';
import '../../widgets/article_tile.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(context), body: _buildBody());
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Daily News', style: TextStyle(color: Colors.black)),
      actions: [
        GestureDetector(
            onTap: () => _onShowSavedArticlesViewTapped(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0),
              child: Icon(
                Ionicons.bookmark,
                color: Colors.black,
              ),
            ))
      ],
    );
  }

  Widget _buildBody() {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticlesState>(
      builder: (BuildContext context, RemoteArticlesState state) {
        return switch (state) {
          RemoteArticlesLoading() =>
            const Center(child: CircularProgressIndicator()),
          RemoteArticlesError() => const Center(child: Icon(Icons.refresh)),
          RemoteArticlesDone() => ListView.builder(
              itemCount: state.articles?.length,
              itemBuilder: (_, index) => ArticleWidget(
                    article: state.articles?[index],
                    onArticlePressed: (article) =>
                        _onArticlePressed(context, article),
                  )),
        };
      },
    );
  }

  _onArticlePressed(BuildContext context, ArticleEntity article) =>
      Navigator.pushNamed(context, '/ArticleDetails', arguments: article);

  _onShowSavedArticlesViewTapped(context) =>
      Navigator.pushNamed(context, '/SavedArticles');
}
