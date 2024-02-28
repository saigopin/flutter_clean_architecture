import 'package:dio/dio.dart';

abstract class IDioOperations {
  Future<Response<dynamic>> get(String path);
  Future<Response<dynamic>> post(String path, {Map<String, dynamic>? body});
  Future<Response<dynamic>> delete(String path,
      {Map<String, dynamic>? body});
  Future<Response<dynamic>> put(String path, {Map<String, dynamic>? body});
  Future<Response<dynamic>> patch(String path, {Map<String, dynamic>? body});
}
