import 'package:flutter_clean_architecture/src/core/network/dio/dio_network.dart';
import 'package:flutter_clean_architecture/src/core/utils/injections.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/data/data_sources/remote/articles_impl_api.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/data/repositories/articles_repo_impl.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/domain/usecases/all_articles_usecase.dart';

import 'domain/repositories/abstract_articles_repository.dart';

void initArticleInjections() {
  getIt.registerSingleton<ArticlesImplApi>(ArticlesImplApi(DioNetwork.appAPI));
  getIt.registerSingleton<AbstractArticleRepository>(ArticlesRepoImpl(getIt()));
  getIt.registerSingleton<AllArticlesUseCase>(AllArticlesUseCase(getIt()));
}
