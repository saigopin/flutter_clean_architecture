import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/src/core/errors/failures.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/domain/models/article_model.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/domain/models/articles_params.dart';

abstract class AbstractArticleRepository {
  // get all the articles by params
  Future<Either<Failure, List<ArticleModel>>> getArticles(ArticlesParams articlesParams);
}
