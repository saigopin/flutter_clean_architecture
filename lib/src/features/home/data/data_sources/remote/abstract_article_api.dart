import 'package:flutter_clean_architecture/src/core/models/api_response.dart';
import 'package:flutter_clean_architecture/src/features/home/home_exports.dart';

abstract class AbstractArticleApi {
  // Get all articles
  Future<ApiResponse<List<ArticleDto>>> getArticles(ArticlesParams params);
}
