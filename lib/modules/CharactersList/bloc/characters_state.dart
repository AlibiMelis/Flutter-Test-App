part of 'characters_bloc.dart';

@immutable
abstract class CharactersState {}

class CharactersLoading extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final CharactersRepo charactersRepo;

  CharactersLoaded({this.charactersRepo = const CharactersRepo()});
  

}