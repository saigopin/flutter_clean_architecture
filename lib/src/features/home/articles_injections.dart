import 'package:flutter_clean_architecture/src/core/injections.dart';
import 'package:flutter_clean_architecture/src/features/home/home_exports.dart';

void initArticleInjections() {
  getIt.registerSingleton<ArticlesImplApi>(ArticlesImplApi(getIt()));
  getIt.registerSingleton<AbstractArticleRepository>(ArticlesRepoImpl(getIt()));
  getIt.registerSingleton<AllArticlesUseCase>(AllArticlesUseCase(getIt()));
}
