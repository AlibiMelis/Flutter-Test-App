// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Episode _$EpisodeFromJson(Map<String, dynamic> json) => Episode(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      airDate: json['airDate'] as String? ?? '',
      episode: json['episode'] as String? ?? '',
      characters: (json['characters'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      url: json['url'] as String? ?? '',
      created: json['created'] as String? ?? '',
    );
