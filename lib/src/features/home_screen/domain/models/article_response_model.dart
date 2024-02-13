class ApiResponse<T> {
  late final String status;
  late final String copyright;
  late final int numResults;
  late final T results;

  ApiResponse({
    required this.status,
    required this.copyright,
    required this.numResults,
    required this.results,
  });

  static dynamic fromJson<T>(Map<dynamic, dynamic> json, Function tFromJson) {
    return ApiResponse<T>(
      status: json['status'],
      copyright: json['copyright'],
      numResults: json['num_results'],
      results: tFromJson(json['results']),
    );
  }
}
