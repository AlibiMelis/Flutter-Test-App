
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'episode.g.dart';

@JsonSerializable(createToJson: false)
class Episode extends Equatable {
  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<String> characters;
  final String url;
  final String created;

  const Episode({
    this.id = 0,
    this.name = '',
    this.airDate = '',
    this.episode = '',
    this.characters = const [],
    this.url = '',
    this.created = '',
  });

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);

  @override
  List<Object?> get props => [id, name];     
}
