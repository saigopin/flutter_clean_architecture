import 'package:flutter_clean_architecture/src/core/injections.dart';
import 'package:flutter_clean_architecture/src/features/home/data/data_sources/remote/articles_impl_api.dart';
import 'package:flutter_clean_architecture/src/features/home/data/repositories/articles_repo_impl.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/usecases/all_articles_usecase.dart';

import 'domain/repositories/abstract_articles_repository.dart';

void initArticleInjections() {
  getIt.registerSingleton<ArticlesImplApi>(ArticlesImplApi(getIt()));
  getIt.registerSingleton<AbstractArticleRepository>(ArticlesRepoImpl(getIt()));
  getIt.registerSingleton<AllArticlesUseCase>(AllArticlesUseCase(getIt()));
}
