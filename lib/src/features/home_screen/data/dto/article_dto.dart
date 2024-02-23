import 'dart:convert';

import 'package:flutter_clean_architecture/src/core/utils/typedef/typedef.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/data/dto/media_dto.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/domain/entities/article.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/domain/entities/media.dart';

class ArticleDto extends Article {
  const ArticleDto({
    required super.uri,
    required super.url,
    required super.id,
    required super.assetId,
    required super.source,
    required super.publishedDate,
    required super.updated,
    required super.section,
    required super.subsection,
    required super.nyTdSection,
    required super.adxKeywords,
    required super.column,
    required super.byline,
    required super.type,
    required super.title,
    required super.abstract,
    required super.desFacet,
    required super.orgFacet,
    required super.perFacet,
    required super.geoFacet,
    required super.media,
    required super.etaId,
  });

  // Empty constructor
  const ArticleDto.empty()
      : this(
          uri: '',
          url: '',
          id: 0,
          assetId: 0,
          source: '',
          publishedDate: '',
          updated: '',
          section: '',
          subsection: '',
          nyTdSection: '',
          adxKeywords: '',
          column: '',
          byline: '',
          type: '',
          title: '',
          abstract: '',
          desFacet: const <String>[],
          orgFacet: const <String>[],
          perFacet: const <String>[],
          geoFacet: const <String>[],
          media: const <Media>[],
          etaId: 0,
        );

  Article copyWith({
    String? uri,
    String? url,
    int? id,
    int? assetId,
    String? source,
    String? publishedDate,
    String? updated,
    String? section,
    String? subsection,
    String? nyTdSection,
    String? adxKeywords,
    String? column,
    String? byline,
    String? type,
    String? title,
    String? abstract,
    List<String>? desFacet,
    List<String>? orgFacet,
    List<String>? perFacet,
    List<String>? geoFacet,
    List<MediaDto>? media,
    int? etaId,
  }) {
    return Article(
      uri: uri ?? this.uri,
      url: url ?? this.url,
      id: id ?? this.id,
      assetId: assetId ?? this.assetId,
      source: source ?? this.source,
      publishedDate: publishedDate ?? this.publishedDate,
      updated: updated ?? this.updated,
      section: section ?? this.section,
      subsection: subsection ?? this.subsection,
      nyTdSection: nyTdSection ?? this.nyTdSection,
      adxKeywords: adxKeywords ?? this.adxKeywords,
      column: column ?? this.column,
      byline: byline ?? this.byline,
      type: type ?? this.type,
      title: title ?? this.title,
      abstract: abstract ?? this.abstract,
      desFacet: desFacet ?? this.desFacet,
      orgFacet: orgFacet ?? this.orgFacet,
      perFacet: perFacet ?? this.perFacet,
      geoFacet: geoFacet ?? this.geoFacet,
      media: media ?? this.media,
      etaId: etaId ?? this.etaId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uri': uri,
      'url': url,
      'id': id,
      'assetId': assetId,
      'source': source,
      'publishedDate': publishedDate,
      'updated': updated,
      'section': section,
      'subsection': subsection,
      'nyTdSection': nyTdSection,
      'adxKeywords': adxKeywords,
      'column': column,
      'byline': byline,
      'type': type,
      'title': title,
      'abstract': abstract,
      'desFacet': desFacet,
      'orgFacet': orgFacet,
      'perFacet': perFacet,
      'geoFacet': geoFacet,
      'media':
          (media as List<MediaDto>).map((MediaDto x) => x.toMap()).toList(),
      'etaId': etaId,
    };
  }

  factory ArticleDto.fromMap(DataMap map) {
    return ArticleDto(
      uri: map['uri'] ?? '',
      url: map['url'] ?? '',
      id: map['id'] ?? 0,
      assetId: map['asset_id'] ?? 0,
      source: map['source'] ?? '',
      publishedDate: map['published_date'] ?? '',
      updated: map['updated'] ?? '',
      section: map['section'] ?? '',
      subsection: map['subsection'] ?? '',
      nyTdSection: map['nytdsection'] ?? '',
      adxKeywords: map['adx_keywords'] ?? '',
      column: map['column'] ?? '',
      byline: map['byline'] ?? '',
      type: map['type'] ?? '',
      title: map['title'] ?? '',
      abstract: map['abstract'] ?? '',
      desFacet: List<String>.from(map['des_facet'] ?? const <String>[]),
      orgFacet: List<String>.from(map['org_facet'] ?? const <String>[]),
      perFacet: List<String>.from(map['per_facet'] ?? const <String>[]),
      geoFacet: List<String>.from(map['geo_facet'] ?? const <String>[]),
      media: map['media'] != null
          ? List<MediaDto>.from(
              (map['media']).map((item) => MediaDto.fromMap(item)))
          : const <MediaDto>[],
      etaId: map['eta_id'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleDto.fromJson(String source) =>
      ArticleDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
