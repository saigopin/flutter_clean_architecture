import 'package:flutter_clean_architecture/src/features/home_screen/domain/entities/article.dart';

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
  final List<Article> articles;
  SuccessGetArticlesState(this.articles);
}

class SearchingGetArticlesState extends ArticlesState {
  final List<Article> articles;
  SearchingGetArticlesState(this.articles);
}
