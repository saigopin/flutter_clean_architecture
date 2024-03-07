import 'dart:convert';

import 'package:flutter_clean_architecture/src/core/utils/typedef/typedef.dart';
import 'package:flutter_clean_architecture/src/features/home/home.dart';

class MediaMetaDataDto extends MediaMetaData {
  const MediaMetaDataDto({
    required super.url,
    required super.format,
    required super.height,
    required super.width,
  });

  MediaMetaDataDto copyWith({
    String? url,
    String? format,
    int? height,
    int? width,
  }) {
    return MediaMetaDataDto(
      url: url ?? this.url,
      format: format ?? this.format,
      height: height ?? this.height,
      width: width ?? this.width,
    );
  }

  // name empty constructor
  const MediaMetaDataDto.empty()
      : this(
          url: '',
          format: '',
          width: 0,
          height: 0,
        );

  DataMap toMap() {
    return <String, dynamic>{
      'url': url,
      'format': format,
      'height': height,
      'width': width,
    };
  }

  MediaMetaDataDto.fromMap(DataMap map)
      : this(
          url: map['url'] as String,
          format: map['format'] as String,
          height: map['height'] as int,
          width: map['width'] as int,
        );

  String toJson() => json.encode(toMap());

  factory MediaMetaDataDto.fromJson(String source) =>
      MediaMetaDataDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
