// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/entities/media_meta_data.dart';

class Media extends Equatable {
  final String type;
  final String subtype;
  final String caption;
  final String copyright;
  final int approvedForSyndication;
  final List<MediaMetaData> mediaMetadata;

  const Media({
    required this.type,
    required this.subtype,
    required this.caption,
    required this.copyright,
    required this.approvedForSyndication,
    required this.mediaMetadata,
  });

  // Named constructor for an empty instance
  const Media.empty()
      : this(
          type: '',
          subtype: '',
          caption: '',
          copyright: '',
          approvedForSyndication: 0,
          mediaMetadata: const [],
        );

  @override
  List<Object?> get props => [
        type,
        subtype,
        caption,
        copyright,
        approvedForSyndication,
        mediaMetadata
      ];
}
