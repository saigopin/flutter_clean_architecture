import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/core/errors/expections.dart';
import 'package:flutter_clean_architecture/src/core/utils/constants/network_constants.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/data/data_sources/remote/abstract_article_api.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/domain/models/article_model.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/domain/models/article_response_model.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/domain/models/articles_params.dart';

class ArticlesImplApi extends AbstractArticleApi {
  final Dio dio;
  ArticlesImplApi(this.dio);
  @override
  Future<ApiResponse<List<ArticleModel>>> getArticles(
      ArticlesParams params) async {
    try {
      final results =
          await dio.get(NetworkConstants.getArticlePath(params.period));

      if (results.data == null) {
        throw ServerException('Unknown Error', results.statusCode);
      }
      return ApiResponse.fromJson<List<ArticleModel>>(
          results.data, ArticleModel.fromJsonList);
    }  on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}
