import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/src/core/errors/failures.dart';
import 'package:flutter_clean_architecture/src/features/home/home.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final AllArticlesUseCase allArticlesUseCase;
  List<Article> allArticlesList = <Article>[];
  ArticlesBloc({required this.allArticlesUseCase})
      : super(LoadingGetArticlesState()) {
    on<OnGettingArticlesEvent>(_onGettingArticlesEvent);
    on<OnSearchingArticlesEvents>(_onSearchingEvent);
  }

  void _onGettingArticlesEvent(
      OnGettingArticlesEvent event, Emitter<ArticlesState> emittor) async {
    if (event.wihtLoading) {
      emittor(LoadingGetArticlesState());
    }

    final Either<Failure, List<Article>> result =
        await allArticlesUseCase.call(ArticlesParams(period: event.period));

    result.fold((Failure l) {
      if (l is CancelTokenFailure) {
        emittor(LoadingGetArticlesState());
      } else {
        emittor(ErrorGetArticlesState(l.errorMessage));
      }
    }, (List<Article> r) {
      allArticlesList = r;
      emittor(SuccessGetArticlesState(_runFilter(event.text)));
    });
  }

  void _onSearchingEvent(
      OnSearchingArticlesEvents event, Emitter<ArticlesState> emittor) async {}

  List<Article> _runFilter(String text) {
    List<Article> results = <Article>[];
    if (text.isEmpty) {
      results = allArticlesList;
    } else {
      results = allArticlesList.where((Article element) {
        return (element.title).toLowerCase().contains(text.toString());
      }).toList();
    }
    return results;
  }
}
