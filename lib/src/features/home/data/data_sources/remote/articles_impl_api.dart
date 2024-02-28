import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/core/errors/expections.dart';
import 'package:flutter_clean_architecture/src/core/models/api_response.dart';
import 'package:flutter_clean_architecture/src/core/network/dio/dio_operations.dart';
import 'package:flutter_clean_architecture/src/core/utils/constants/network_constants.dart';
import 'package:flutter_clean_architecture/src/features/home/data/data_sources/remote/abstract_article_api.dart';
import 'package:flutter_clean_architecture/src/features/home/data/dto/article_dto.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/entities/artciles_params.dart';

class ArticlesImplApi extends AbstractArticleApi {
  final DioOperations dioOperations;
  ArticlesImplApi(this.dioOperations);
  @override
  Future<ApiResponse<List<ArticleDto>>> getArticles(
      ArticlesParams params) async {
    try {
      final Response<dynamic> results = await dioOperations
          .get(NetworkConstants.getArticlePath(params.period));
      return ApiResponse.fromJson<List<ArticleDto>, ArticleDto>(
        results.data,
        ArticleDto.fromMap,
      );
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}
