import 'dart:convert';

import 'package:flutter_clean_architecture/src/core/utils/typedef/typedef.dart';
import 'package:flutter_clean_architecture/src/features/home/home.dart';

class MediaDto extends Media {
  const MediaDto({
    required super.type,
    required super.subtype,
    required super.caption,
    required super.copyright,
    required super.approvedForSyndication,
    required super.mediaMetadata,
  });

  const MediaDto.empty()
      : this(
          type: '',
          subtype: '',
          caption: '',
          mediaMetadata: const <MediaMetaData>[],
          copyright: '',
          approvedForSyndication: 0,
        );

  MediaDto copyWith({
    String? type,
    String? subtype,
    String? caption,
    String? copyright,
    int? approvedForSyndication,
    List<MediaMetaDataDto>? mediaMetadata,
  }) {
    return MediaDto(
      type: type ?? this.type,
      subtype: subtype ?? this.subtype,
      caption: caption ?? this.caption,
      copyright: copyright ?? this.copyright,
      approvedForSyndication:
          approvedForSyndication ?? this.approvedForSyndication,
      mediaMetadata: mediaMetadata ?? this.mediaMetadata,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'subtype': subtype,
      'caption': caption,
      'copyright': copyright,
      'approvedForSyndication': approvedForSyndication,
      'mediaMetadata': (mediaMetadata as List<MediaMetaDataDto>)
          .map((MediaMetaDataDto data) => data.toMap())
          .toList(),
    };
  }

  factory MediaDto.fromMap(DataMap json) {
    return MediaDto(
      type: json['type'] ?? '',
      subtype: json['subtype'] ?? '',
      caption: json['caption'] ?? '',
      copyright: json['copyright'] ?? '',
      approvedForSyndication: json['approved_for_syndication'] ?? 0,
      mediaMetadata: json['media-metadata'] != null
          ? List<MediaMetaDataDto>.from((json['media-metadata'])
              .map((dynamic item) => MediaMetaDataDto.fromMap(item)))
          : const <MediaMetaDataDto>[],
    );
  }

  String toJson() => json.encode(toMap());

  factory MediaDto.fromJson(String source) =>
      MediaDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
