import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/src/core/exports.dart';
import 'package:flutter_clean_architecture/src/core/utils/injections.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/entities/article.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/usecases/all_articles_usecase.dart';
import 'package:flutter_clean_architecture/src/features/home/presentation/bloc/articles_bloc.dart';
import 'package:flutter_clean_architecture/src/features/home/presentation/bloc/articles_event.dart';
import 'package:flutter_clean_architecture/src/features/home/presentation/bloc/articles_state.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/presentation/widgets/articles_list_shimmer_widget.dart';

class AritclesPage extends StatefulWidget {
  const AritclesPage({super.key});

  @override
  State<AritclesPage> createState() => _AritclesPageState();
}

class _AritclesPageState extends State<AritclesPage> with TextStyles {
  final ArticlesBloc _articlesBloc =
      ArticlesBloc(allArticlesUseCase: sl<AllArticlesUseCase>());

  List<Article> articleModelList = [];

  @override
  void initState() {
    callArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
      ),
      body: BlocConsumer<ArticlesBloc, ArticlesState>(
        bloc: _articlesBloc,
        listener: (BuildContext context, ArticlesState state) {
          if (state is SuccessGetArticlesState) {
            articleModelList = state.articles;
          }
        },
        builder: (BuildContext context, ArticlesState state) {
          if (state is LoadingGetArticlesState) {
            return const CircularProgressIndicator();
          } else if (state is ErrorGetArticlesState) {
            return Text('Retry again ${state.message}');
          }
          if (articleModelList.isEmpty) {
            return const Text('No Articles');
          } else {
            return Text(
              'Articles ${articleModelList.length}',
              style: smallTextStyle(),
            );
          }
        },
      ),
    );
  }

  void callArticles() {
    _articlesBloc.add(OnGettingArticlesEvent(period: 1));
  }
}
