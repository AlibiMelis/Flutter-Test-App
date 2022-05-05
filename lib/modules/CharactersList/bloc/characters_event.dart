part of 'characters_bloc.dart';

@immutable
abstract class CharactersEvent {}

class LoadCharactersEvent extends CharactersEvent {}

class LoadMoreEvent extends CharactersEvent {
  final List<Character> characters;
  final String next;
  final bool hasReachedMax;
  LoadMoreEvent({this.characters = const [], this.next = '', this.hasReachedMax = true});
}
