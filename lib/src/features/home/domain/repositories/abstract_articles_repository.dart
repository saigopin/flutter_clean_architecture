import 'package:flutter_clean_architecture/src/core/utils/typedef/typedef.dart';
import 'package:flutter_clean_architecture/src/features/home/home_exports.dart';

abstract class AbstractArticleRepository {
  // get all the articles by params
  ResultFuture<List<Article>> getArticles(ArticlesParams articlesParams);
}
