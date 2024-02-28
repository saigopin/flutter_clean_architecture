import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/src/core/exports.dart';
import 'package:flutter_clean_architecture/src/core/utils/constants/app_strings.dart';
import 'package:flutter_clean_architecture/src/core/injections.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/entities/article.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/usecases/all_articles_usecase.dart';
import 'package:flutter_clean_architecture/src/features/home/presentation/bloc/articles_bloc.dart';
import 'package:flutter_clean_architecture/src/features/home/presentation/bloc/articles_event.dart';
import 'package:flutter_clean_architecture/src/features/home/presentation/bloc/articles_state.dart';
import 'package:flutter_clean_architecture/src/features/home/presentation/pages/widgets/articles_list_shimmer_widget.dart';
import 'package:flutter_clean_architecture/src/shared/shared.dart';

class ArticlesPage extends StatefulWidget {

  const ArticlesPage({super.key});

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> with TextStyles {
  final ArticlesBloc _articlesBloc =
      ArticlesBloc(allArticlesUseCase: getIt<AllArticlesUseCase>());

  List<Article> articleModelList = <Article>[];

  void _tileOnTapHandler() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => BottomSheetWidget(
        heading: 'Your Card is now Activated',
        description: 'You can start using your physical\ncard now',
        buttonOnPressedHandler: () {},
      ),
    );
  }

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
        actions: const <Widget>[ThemeSwitchWidget()],
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
            return const ArticleListShimmerWidget();
          } else if (state is ErrorGetArticlesState) {
            return Text('Retry again ${state.message}');
          }
          if (articleModelList.isEmpty) {
            return const Text('No Articles');
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: articleModelList.length,
                  itemBuilder: (BuildContext context, int index) {
                    Article articleData = articleModelList[index];

                    String imageUrl = articleData.media.isNotEmpty &&
                            articleData.media.first.mediaMetadata.isNotEmpty
                        ? articleData.media.first.mediaMetadata.first.url
                        : AppStrings.noImageURL;

                    return TileWidget(
                      onTapHandler: _tileOnTapHandler,
                      isLocalImage: false,
                      isIcon: false,
                      image: imageUrl,
                      isNetworkImage: true,
                      title: articleData.title,
                      subtitle: 'test title',
                      trailingText: '5000',
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 10),
                ),
              ),
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
