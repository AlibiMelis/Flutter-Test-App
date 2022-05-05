import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/model/character.dart';
part 'characters_repo.g.dart';

@JsonSerializable(createToJson: false)
class CharactersRepo {
  final Map<String, dynamic> info;
  final List<Character> results;

  const CharactersRepo({this.info = const {}, this.results = const []});
  factory CharactersRepo.fromJson(Map<String, dynamic> json) =>
      _$CharactersRepoFromJson(json);
}
