// Required params for this use-case
class ArticlesParams {
  ArticlesParams({
    required this.period,
  });

  late final int period;

  ArticlesParams.fromJson(Map<String, dynamic> json) {
    period = json['period'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['period'] = period;
    return data;
  }
}
