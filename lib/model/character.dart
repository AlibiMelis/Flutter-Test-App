import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/model/location.dart';
part 'character.g.dart';

enum Status {
  @JsonValue("Alive")
  alive,
  @JsonValue("Dead")
  dead,
  @JsonValue("unknown")
  unknown,
}

enum Gender {
  @JsonValue("Female")
  female,
  @JsonValue("Male")
  male,
  @JsonValue("Genderless")
  genderless,
  @JsonValue("unknown")
  unknown,
}

@JsonSerializable(createToJson: false)
class Character extends Equatable {
  final int id;
  final String name;
  final Status status;
  final String species;
  final String type;
  final Gender gender;
  final Location origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  const Character(
      {this.id = 0,
      this.name = '',
      this.status = Status.unknown,
      this.species = '',
      this.type = '',
      this.gender = Gender.unknown,
      this.origin = const Location(),
      this.location = const Location(),
      this.image = '',
      this.episode = const <String>[],
      this.url = '',
      this.created = ''});
  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  @override
  List<Object> get props => [id, name];
}
