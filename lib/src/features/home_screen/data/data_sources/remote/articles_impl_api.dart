import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/core/errors/expections.dart';
import 'package:flutter_clean_architecture/src/core/models/api_response.dart';
import 'package:flutter_clean_architecture/src/core/utils/constants/network_constants.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/data/data_sources/remote/abstract_article_api.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/data/dto/article_dto.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/domain/entities/artciles_params.dart';

class ArticlesImplApi extends AbstractArticleApi {
  final Dio dio;
  ArticlesImplApi(this.dio);
  @override
  Future<ApiResponse<List<ArticleDto>>> getArticles(
      ArticlesParams params) async {
    try {
      // ignore: always_specify_types
      final results =
          await dio.get(NetworkConstants.getArticlePath(params.period));

      if (results.data == null) {
        throw ServerException('Unknown Error', results.statusCode);
      }

      return ApiResponse.fromJson<List<ArticleDto>>(
          results.data, ArticleDto.fromMap);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}
