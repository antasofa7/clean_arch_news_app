import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:new_app_clean_arch/features/daily_news/domain/entities/article.dart';

import '../../../../../injection_container.dart';
import '../../bloc/article/local/local_article_bloc.dart';
import '../../widgets/article_tile.dart';

class SavedArticlesPage extends HookWidget {
  const SavedArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<LocalArticlesBloc>()..add(const GetSavedArticles()),
        child: Scaffold(appBar: _buildAppBar(), body: _buildBody()));
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
        leading: Builder(
            builder: (context) => GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => _onBackButtonTapped(context),
                child: const Icon(Ionicons.chevron_back, color: Colors.black))),
        title: const Text('Saved Artciles',
            style: TextStyle(color: Colors.black)));
  }

  Widget _buildBody() {
    return BlocBuilder<LocalArticlesBloc, LocalArticlesState>(
      builder: (context, state) {
        if (state is LocalArticlesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is LocalArticlesDone) {
          return _buildArticlesList(state.article!);
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildArticlesList(List<ArticleEntity> articles) {
    if (articles.isEmpty) {
      return const Center(
          child:
              Text('No saved articles', style: TextStyle(color: Colors.black)));
    }

    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) => ArticleWidget(
        article: articles[index],
        isRemovable: true,
        onRemove: (article) => _onRemoveArticle(context, article),
        onArticlePressed: (article) => _onArticlePressed(context, article),
      ),
    );
  }

  void _onBackButtonTapped(context) => Navigator.pop(context);

  void _onRemoveArticle(BuildContext context, ArticleEntity article) {
    BlocProvider.of<LocalArticlesBloc>(context).add(RemoveArticle(article));
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }
}
