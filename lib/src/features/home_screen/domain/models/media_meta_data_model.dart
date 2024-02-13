import 'package:json_annotation/json_annotation.dart';

part 'media_meta_data_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MediaMetaDataModel {
  String url;
  String format;
  int height;
  int width;

  MediaMetaDataModel(
      {this.url = '', this.format = '', this.height = 0, this.width = 0});

  factory MediaMetaDataModel.fromJson(dynamic json) =>
      _$MediaMetaDataModelFromJson(json);

  dynamic toJson() => _$MediaMetaDataModelToJson(this);

  static List<MediaMetaDataModel> fromJsonList(List<dynamic> json) {
    return json.map((dynamic e) => MediaMetaDataModel.fromJson(e)).toList();
  }
}
