import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/src/core/errors/expections.dart';
import 'package:flutter_clean_architecture/src/core/errors/failures.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/data/data_sources/remote/articles_impl_api.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/domain/models/article_model.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/domain/models/article_response_model.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/domain/models/articles_params.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/domain/repositories/abstract_articles_repository.dart';

class ArticlesRepoImpl extends AbstractArticleRepository {
  final ArticlesImplApi articlesImplApi;
  ArticlesRepoImpl(this.articlesImplApi);
  @override
  Future<Either<Failure, List<ArticleModel>>> getArticles(
      ArticlesParams articlesParams) async {
    try {
      final ApiResponse<List<ArticleModel>> results =
          await articlesImplApi.getArticles(articlesParams);
      return Right<Failure, List<ArticleModel>>(results.results);
    } on ServerException catch (e) {
      return Left<Failure, List<ArticleModel>>(
          ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left<Failure, List<ArticleModel>>(
          ServerFailure(e.message, e.statusCode));
    }
  }
}
