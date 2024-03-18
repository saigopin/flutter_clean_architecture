part of 'articles_bloc.dart';

abstract class ArticlesEvent {
  const ArticlesEvent();
}

class OnGettingArticlesEvent extends ArticlesEvent {
  final String text;
  final int period;
  final bool wihtLoading;
  OnGettingArticlesEvent(
      {this.text = '', this.period = 0, this.wihtLoading = false});
}

class OnSearchingArticlesEvents extends ArticlesEvent {
  final String text;

  OnSearchingArticlesEvents({this.text = ''});
}
