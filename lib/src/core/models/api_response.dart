import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/src/core/utils/typedef/typedef.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/data/dto/article_dto.dart';

class ApiResponse<T> extends Equatable {
  final String status;
  final String copyright;
  final int numResults;
  final T results;

  const ApiResponse({
    required this.status,
    required this.copyright,
    required this.numResults,
    required this.results,
  });

  static ApiResponse<T> fromJson<T,P>(
    Map<dynamic, dynamic> json, Function tFromJson, {
    bool isList = true,
  }) {
    return ApiResponse<T>(
      status: json['status'],
      copyright: json['copyright'],
      numResults: json['num_results'],
      results: isList
          ? (json['results'] as List<dynamic>)
              .map((dynamic data) => tFromJson(data) as P)
              .toList()
          : tFromJson(json['results'] as P),
    );
  }

  @override
  List<Object?> get props => <Object?>[status, copyright, numResults, results];
}
