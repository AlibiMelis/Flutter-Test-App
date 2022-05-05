// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersRepo _$CharactersRepoFromJson(Map<String, dynamic> json) =>
    CharactersRepo(
      info: json['info'] as Map<String, dynamic>? ?? const {},
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => Character.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );
