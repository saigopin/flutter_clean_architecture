import 'package:flutter_clean_architecture/src/core/network/dio/dio_network.dart';
import 'package:flutter_clean_architecture/src/core/utils/injections.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/data/data_sources/remote/articles_impl_api.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/data/repositories/articles_repo_impl.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/domain/usecases/all_articles_usecase.dart';

import 'domain/repositories/abstract_articles_repository.dart';

initArticleInjections() {
  sl.registerSingleton<ArticlesImplApi>(ArticlesImplApi(DioNetwork.appAPI));
  sl.registerSingleton<AbstractArticleRepository>(ArticlesRepoImpl(sl()));
  sl.registerSingleton<AllArticlesUseCase>(AllArticlesUseCase(sl()));
}
