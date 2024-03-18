import 'package:equatable/equatable.dart';

class MediaMetaData extends Equatable {
  final String url;
  final String format;
  final int height;
  final int width;

  const MediaMetaData({
    required this.url,
    required this.format,
    required this.height,
    required this.width,
  });

  // Named constructor for an empty instance
  const MediaMetaData.empty() : this(url: '', format: '', height: 0, width: 0);

  @override
  List<Object?> get props => <Object?>[url, format, width, height];
}
