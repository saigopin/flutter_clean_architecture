import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/src/core/utils/typedef/typedef.dart';
import 'package:flutter_clean_architecture/src/core/utils/usecases/usecase.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/domain/entities/artciles_params.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/domain/entities/article.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/domain/repositories/abstract_articles_repository.dart';

class AllArticlesUseCase extends UseCase<List<Article>, ArticlesParams> {
  final AbstractArticleRepository repository;
  AllArticlesUseCase(this.repository);
  @override
  ResultFuture<List<Article>> call(
      ArticlesParams params) async {
    final results = await repository.getArticles(params);
    return results.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}
