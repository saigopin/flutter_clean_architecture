import 'package:flutter_clean_architecture/src/core/network/dio/dio_network.dart';
import 'package:flutter_clean_architecture/src/core/utils/injections.dart';
import 'package:flutter_clean_architecture/src/features/home/data/data_sources/remote/articles_impl_api.dart';
import 'package:flutter_clean_architecture/src/features/home/data/repositories/articles_repo_impl.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/usecases/all_articles_usecase.dart';

import 'domain/repositories/abstract_articles_repository.dart';

void initArticleInjections() {
  sl.registerSingleton<ArticlesImplApi>(ArticlesImplApi(DioNetwork.appAPI));
  sl.registerSingleton<AbstractArticleRepository>(ArticlesRepoImpl(sl()));
  sl.registerSingleton<AllArticlesUseCase>(AllArticlesUseCase(sl()));
}
