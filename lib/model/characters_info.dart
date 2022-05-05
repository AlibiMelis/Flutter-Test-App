import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'characters_info.g.dart';

@JsonSerializable(createToJson: false)
class CharactersInfo extends Equatable {
  final int count;
  final int pages;
  final String next;
  final String prev;

  const CharactersInfo({this.count = 0, this.pages = 0, this.next = '', this.prev = ''});
  factory CharactersInfo.fromJson(Map<String, dynamic> json) =>
      _$CharactersInfoFromJson(json);

  @override
  List<Object> get props => [count, pages, next, prev];
}