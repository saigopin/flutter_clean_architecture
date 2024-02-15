import 'package:flutter_clean_architecture/src/core/models/api_response.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/data/dto/article_dto.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/domain/entities/artciles_params.dart';

abstract class AbstractArticleApi {
  // Get all articles
  Future<ApiResponse<List<ArticleDto>>> getArticles(ArticlesParams params);
}
