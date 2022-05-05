import 'package:json_annotation/json_annotation.dart';
part 'location.g.dart';

@JsonSerializable(createToJson: false)
class Location {
  final String name;
  final String url;

  const Location({this.name = '', this.url = ''});
  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}