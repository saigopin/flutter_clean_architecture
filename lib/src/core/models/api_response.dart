import 'package:equatable/equatable.dart';

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

  static ApiResponse<T> fromJson<T>(
      Map<dynamic, dynamic> json, Function tFromJson) {
    return ApiResponse<T>(
      status: json['status'],
      copyright: json['copyright'],
      numResults: json['num_results'],
      results: tFromJson(json['results']),
    );
  }

  @override
  List<Object?> get props => <Object?>[status, copyright, numResults, results];
}
