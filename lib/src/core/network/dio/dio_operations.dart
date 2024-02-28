import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/core/errors/expections.dart';
import 'package:flutter_clean_architecture/src/core/network/dio/dio_operations_abstract.dart';

class DioOperations implements IDioOperations {
  final Dio dio;

  DioOperations(this.dio);

  Future<Response<dynamic>> _handleRequest(
    Future<Response<dynamic>> Function() requestFunction,
  ) async {
    try {
      final Response<dynamic> response = await requestFunction();
      if (response.data == null) {
        throw ServerException('Unknown Error', response.statusCode);
      }
      return response;
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }

  @override
  Future<Response<dynamic>> get(String path) async =>
      _handleRequest(() => dio.get(path));

  @override
  Future<Response<dynamic>> delete(String path,
          {Map<String, dynamic>? body}) =>
      _handleRequest(() => dio.delete(path, data: body));

  @override
  Future<Response<dynamic>> patch(String path,
          {Map<String, dynamic>? body}) =>
      _handleRequest(() => dio.patch(path, data: body));

  @override
  Future<Response<dynamic>> post(String path,
          {Map<String, dynamic>? body}) =>
      _handleRequest(() => dio.post(path, data: body));

  @override
  Future<Response<dynamic>> put(String path, {Map<String, dynamic>? body}) =>
      _handleRequest(() => dio.put(path, data: body));
}
