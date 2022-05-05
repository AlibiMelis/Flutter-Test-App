part of 'characters_bloc.dart';

@immutable
abstract class CharactersState extends Equatable {}

class CharactersLoadingState extends CharactersState {
  @override
  List<Object?> get props => [];
}

class CharactersLoadedState extends CharactersState {
  final bool hasReachedMax;
  final CharactersInfo info;
  final List<Character> characters;

  CharactersLoadedState({
    this.characters = const [],
    this.info = const CharactersInfo(),
    this.hasReachedMax = false,
  });

  @override
  List<Object?> get props => [characters, hasReachedMax, info];
}
