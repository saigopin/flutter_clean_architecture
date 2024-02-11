import 'package:flutter_clean_architecture/src/features/home_screen/domain/models/article_model.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/domain/models/article_response_model.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/domain/models/articles_params.dart';

abstract class AbstractArticleApi{
  // Get all articles
  Future<ApiResponse<List<ArticleModel>>> getArticles(
      ArticlesParams params);
}