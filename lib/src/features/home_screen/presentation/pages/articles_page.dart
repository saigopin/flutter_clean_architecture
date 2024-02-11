import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/src/core/utils/injections.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/domain/models/article_model.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/domain/usecases/all_articles_usecase.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/presentation/bloc/articles_bloc.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/presentation/bloc/articles_event.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/presentation/bloc/articles_state.dart';

class AritclesPage extends StatefulWidget {
  const AritclesPage({super.key});

  @override
  State<AritclesPage> createState() => _AritclesPageState();
}

class _AritclesPageState extends State<AritclesPage> {
  final ArticlesBloc _articlesBloc =
      ArticlesBloc(allArticlesUseCase: sl<AllArticlesUseCase>());

  List<ArticleModel> articleModelList = [];

  @override
  void initState() {
    callArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Articles"),
      ),
      body: BlocConsumer(
        bloc: _articlesBloc,
        listener: (context, state) {
          if (state is SuccessGetArticlesState) {
            articleModelList = state.articles;
          }
        },
        builder: (context, state) {
          if (state is LoadingGetArticlesState) {
            return const CircularProgressIndicator();
          } else if (state is ErrorGetArticlesState) {
            return Text("Retry again ${state.message}");
          }
          if (articleModelList.isEmpty) {
            return Text("No Articles");
          } else {
            return Text("Articles ${articleModelList.length}");
          }
        },
      ),
    );
  }

  callArticles() {
    _articlesBloc.add(OnGettingArticlesEvent(
      period: 1
    ));
  }
}
