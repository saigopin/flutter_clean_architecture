import 'package:dio/dio.dart';

abstract class IDioOperations {
  Future<Response<dynamic>> get<T>(String path);
  Future<Response<dynamic>> post<T>(String path, {Map<String, dynamic>? body});
  Future<Response<dynamic>> delete<T>(String path,
      {Map<String, dynamic>? body});
  Future<Response<dynamic>> put<T>(String path, {Map<String, dynamic>? body});
  Future<Response<dynamic>> patch<T>(String path, {Map<String, dynamic>? body});
}
