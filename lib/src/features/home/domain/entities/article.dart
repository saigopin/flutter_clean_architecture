import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/src/features/home/home.dart';

class Article extends Equatable {
  final String uri;
  final String url;
  final int id;
  final int assetId;
  final String source;
  final String publishedDate;
  final String updated;
  final String section;
  final String subsection;
  final String nyTdSection;
  final String adxKeywords;
  final String column;
  final String byline;
  final String type;
  final String title;
  final String abstract;
  final List<String> desFacet;
  final List<String> orgFacet;
  final List<String> perFacet;
  final List<String> geoFacet;
  final List<Media> media;
  final int etaId;

  const Article({
    required this.uri,
    required this.url,
    required this.id,
    required this.assetId,
    required this.source,
    required this.publishedDate,
    required this.updated,
    required this.section,
    required this.subsection,
    required this.nyTdSection,
    required this.adxKeywords,
    required this.column,
    required this.byline,
    required this.type,
    required this.title,
    required this.abstract,
    required this.desFacet,
    required this.orgFacet,
    required this.perFacet,
    required this.geoFacet,
    required this.media,
    required this.etaId,
  });

  // Empty constructor
  const Article.empty()
      : uri = '',
        url = '',
        id = 0,
        assetId = 0,
        source = '',
        publishedDate = '',
        updated = '',
        section = '',
        subsection = '',
        nyTdSection = '',
        adxKeywords = '',
        column = '',
        byline = '',
        type = '',
        title = '',
        abstract = '',
        desFacet = const <String>[],
        orgFacet = const <String>[],
        perFacet = const <String>[],
        geoFacet = const <String>[],
        media = const <Media>[],
        etaId = 0;

  @override
  List<Object?> get props => <Object?>[uri, url, id];
}
