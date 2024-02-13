import 'package:json_annotation/json_annotation.dart';
import 'media_meta_data_model.dart';

part 'media_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MediaModel {
  String type;
  String subtype;
  String caption;
  String copyright;
  int approvedForSyndication;
  @JsonKey(name: 'media-metadata')
  List<MediaMetaDataModel> mediaMetadata;

  MediaModel(
      {this.type = '',
      this.subtype = '',
      this.caption = '',
      this.copyright = '',
      this.approvedForSyndication = 0,
      this.mediaMetadata = const <MediaMetaDataModel>[]});

  factory MediaModel.fromJson(dynamic json) => _$MediaModelFromJson(json);

  dynamic toJson() => _$MediaModelToJson(this);

  static List<MediaModel> fromJsonList(List<dynamic> json) {
    return json.map((dynamic e) => MediaModel.fromJson(e)).toList();
  }
}
