import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/model/location.dart';
part 'character.g.dart';

@JsonSerializable(createToJson: false)
class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Location origin;
  final Location location;
  final String imageUrl;
  final List<String> episode;
  final String url;
  final String created;

  const Character(
      {this.id = 0,
      this.name = '',
      this.status = '',
      this.species = '',
      this.type = '',
      this.gender = '',
      this.origin = const Location(),
      this.location = const Location(),
      this.imageUrl = '',
      this.episode = const <String>[],
      this.url = '',
      this.created = ''});
  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}
