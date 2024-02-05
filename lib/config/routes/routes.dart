import 'package:flutter/material.dart';

import '../../features/daily_news/domain/entities/article.dart';
import '../../features/daily_news/presentation/pages/detail/article_detail.dart';
import '../../features/daily_news/presentation/pages/home/daily_news.dart';
import '../../features/daily_news/presentation/pages/saved_article/saved_article_page.dart';

class AppRoutes {
  static Route? onGenerateRoutes(RouteSettings settings) {
    return switch (settings.name) {
      '/' => _materialRoute(const DailyNews()),
      '/ArticleDetails' => _materialRoute(ArticleDetailPage(
          article: settings.arguments as ArticleEntity,
        )),
      '/SavedArticles' => _materialRoute(const SavedArticlesPage()),
      String() => null,
      null => null,
    };
  }

  static Route _materialRoute(Widget page) =>
      MaterialPageRoute(builder: (_) => page);
}
