import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/src/core/exports.dart';
import 'package:flutter_clean_architecture/src/core/utils/constants/app_strings.dart';
import 'package:flutter_clean_architecture/src/core/utils/injections.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/entities/article.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/usecases/all_articles_usecase.dart';
import 'package:flutter_clean_architecture/src/features/home/presentation/bloc/articles_bloc.dart';
import 'package:flutter_clean_architecture/src/features/home/presentation/bloc/articles_event.dart';
import 'package:flutter_clean_architecture/src/features/home/presentation/bloc/articles_state.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/presentation/widgets/articles_list_shimmer_widget.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/presentation/widgets/tile_widget.dart';

class AritclesPage extends StatefulWidget {
  const AritclesPage({super.key});

  @override
  State<AritclesPage> createState() => _AritclesPageState();
}

class _AritclesPageState extends State<AritclesPage> with TextStyles {
  final ArticlesBloc _articlesBloc =
      ArticlesBloc(allArticlesUseCase: sl<AllArticlesUseCase>());

  List<Article> articleModelList = <Article>[];

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
      body:

      BlocConsumer<ArticlesBloc, ArticlesState>(
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
                      isLocalImage: false,
                      isIcon: false,
                      image: imageUrl,
                      isNetworkImage: true,
                      title: articleData.title,
                      subtitle: "test title",
                      trailingText: "5000",

                    );

                    // ConstrainedBox(
                    //   constraints: BoxConstraints(
                    //     maxHeight: MediaQuery.of(context).size.height * 0.15,
                    //     maxWidth: MediaQuery.of(context).size.width,
                    //   ),
                    //   child: Row(
                    //     children: <Widget>[
                    //       CachedNetworkImage(
                    //         imageUrl: imageUrl,
                    //         width: 130,
                    //         height: 150,
                    //         fit: BoxFit.fitWidth,
                    //       ),
                    //       const SizedBox(width: 10),
                    //       Expanded(
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: <Widget>[
                    //             Text(
                    //               articleData.title,
                    //               overflow: TextOverflow.ellipsis,
                    //             ),
                    //             Text(
                    //               articleData.abstract,
                    //               style: const TextStyle(color: Colors.grey),
                    //               maxLines: 2,
                    //               overflow: TextOverflow.ellipsis,
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // );
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
