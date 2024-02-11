import 'package:flutter_clean_architecture/src/features/home_screen/domain/models/article_model.dart';

abstract class ArticlesState {
  const ArticlesState();
}

class NyTimesInitial extends ArticlesState {}

class LoadingGetArticlesState extends ArticlesState {}

class ErrorGetArticlesState extends ArticlesState {
  final String message;
  ErrorGetArticlesState(this.message);
}

class SuccessGetArticlesState extends ArticlesState {
  final List<ArticleModel> articles;
  SuccessGetArticlesState(this.articles);
}

class SearchingGetArticlesState extends ArticlesState {
  final List<ArticleModel> articles;
  SearchingGetArticlesState(this.articles);
}
