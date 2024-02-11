import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/src/core/errors/failures.dart';
import 'package:flutter_clean_architecture/src/core/utils/usecases/usecase.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/domain/models/article_model.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/domain/models/articles_params.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/domain/repositories/abstract_articles_repository.dart';

class AllArticlesUseCase extends UseCase<List<ArticleModel>, ArticlesParams> {
  final AbstractArticleRepository repository;
  AllArticlesUseCase(this.repository);
  @override
  Future<Either<Failure, List<ArticleModel>>> call(
      ArticlesParams params) async {
    final results = await repository.getArticles(params);
    return results.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}
