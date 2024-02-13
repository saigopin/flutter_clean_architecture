import 'package:json_annotation/json_annotation.dart';
import 'media_model.dart';

part 'article_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ArticleModel {
  String uri;
  String url;
  int id;
  int assetId;
  String source;
  String publishedDate;
  String updated;
  String section;
  String subsection;
  @JsonKey(name: 'nytdsection')
  String nyTdSection;
  String adxKeywords;
  String column;
  String byline;
  String type;
  String title;
  String abstract;
  List<String> desFacet;
  List<String> orgFacet;
  List<String> perFacet;
  List<String> geoFacet;
  List<MediaModel> media;
  int? etaId;

  ArticleModel(
      {this.uri = '',
      this.url = '',
      this.id = 0,
      this.assetId = 0,
      this.source = '',
      this.publishedDate = '',
      this.updated = '',
      this.section = '',
      this.subsection = '',
      this.nyTdSection = '',
      this.adxKeywords = '',
      this.column = '',
      this.byline = '',
      this.type = '',
      this.title = '',
      this.abstract = '',
      this.desFacet = const <String>[],
      this.orgFacet = const <String>[],
      this.perFacet = const <String>[],
      this.geoFacet = const <String>[],
      this.media = const <MediaModel>[],
      this.etaId});

  factory ArticleModel.fromJson(dynamic json) => _$ArticleModelFromJson(json);

  dynamic toJson() => _$ArticleModelToJson(this);

  static List<ArticleModel> fromJsonList(List<dynamic> json) {
    return json.map((dynamic e) => ArticleModel.fromJson(e)).toList();
  }
}
