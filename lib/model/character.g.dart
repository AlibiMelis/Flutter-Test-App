// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      status: $enumDecodeNullable(_$StatusEnumMap, json['status']) ??
          Status.unknown,
      species: json['species'] as String? ?? '',
      type: json['type'] as String? ?? '',
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']) ??
          Gender.unknown,
      origin: json['origin'] == null
          ? const Location()
          : Location.fromJson(json['origin'] as Map<String, dynamic>),
      location: json['location'] == null
          ? const Location()
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      image: json['image'] as String? ?? '',
      episode: (json['episode'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      url: json['url'] as String? ?? '',
      created: json['created'] as String? ?? '',
    );

const _$StatusEnumMap = {
  Status.alive: 'Alive',
  Status.dead: 'Dead',
  Status.unknown: 'unknown',
};

const _$GenderEnumMap = {
  Gender.female: 'Female',
  Gender.male: 'Male',
  Gender.genderless: 'Genderless',
  Gender.unknown: 'unknown',
};
