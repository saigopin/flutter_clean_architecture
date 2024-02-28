import 'package:flutter_clean_architecture/src/core/utils/typedef/typedef.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/entities/artciles_params.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/entities/article.dart';

abstract class AbstractArticleRepository {
  // get all the articles by params
  ResultFuture<List<Article>> getArticles(ArticlesParams articlesParams);
}
