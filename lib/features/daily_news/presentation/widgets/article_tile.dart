import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../domain/entities/article.dart';

class ArticleWidget extends StatelessWidget {
  final ArticleEntity? article;
  final bool? isRemovable;
  final void Function(ArticleEntity article)? onRemove;
  final void Function(ArticleEntity article)? onArticlePressed;

  const ArticleWidget(
      {super.key,
      this.article,
      this.isRemovable,
      this.onRemove,
      this.onArticlePressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _onTap,
        child: Container(
            padding: const EdgeInsetsDirectional.fromSTEB(
              24.0,
              7.0,
              14.0,
              7.0,
            ),
            height: MediaQuery.of(context).size.width / 2.2,
            child: Row(children: [
              _buildImage(context),
              _buildTitleAndDescription(),
              _buildRemovableArea()
            ])));
  }

  Widget _buildImage(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: article?.urlToImage ?? '',
      imageBuilder: (context, imageProvider) => Padding(
          padding: const EdgeInsetsDirectional.only(end: 14.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.08),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover)),
              ))),
      progressIndicatorBuilder: (context, url, progress) => Padding(
          padding: const EdgeInsetsDirectional.only(end: 14.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: double.maxFinite,
                decoration: BoxDecoration(color: Colors.black.withOpacity(.08)),
                child: const CupertinoActivityIndicator(),
              ))),
      errorWidget: (context, url, error) => Padding(
          padding: const EdgeInsetsDirectional.only(end: 14.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: double.maxFinite,
                decoration: BoxDecoration(color: Colors.black.withOpacity(.08)),
                child: const Icon(Icons.error),
              ))),
    );
  }

  Widget _buildTitleAndDescription() {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title
                  Text(article?.title ?? '',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontFamily: 'Butler',
                          fontWeight: FontWeight.w900,
                          fontSize: 18.0,
                          color: Colors.black87)),
                  // description
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            article?.description ?? '',
                            maxLines: 2,
                          ))),

                  // date time
                  Row(children: [
                    const Icon(
                      Icons.timeline_outlined,
                      size: 16.0,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(article?.publishedAt ?? '',
                        style: const TextStyle(fontSize: 12.0))
                  ])
                ])));
  }

  Widget _buildRemovableArea() {
    if (isRemovable ?? false) {
      return GestureDetector(
          onTap: _onRemove,
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.remove_circle_outline,
                color: Colors.red,
              )));
    }
    return const SizedBox();
  }

  void _onTap() {
    if (onArticlePressed != null) {
      onArticlePressed!(article!);
    }
  }

  void _onRemove() {
    if (onRemove != null) {
      onRemove!(article!);
    }
  }
}
