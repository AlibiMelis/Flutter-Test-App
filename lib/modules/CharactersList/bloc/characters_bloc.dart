import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/model/character.dart';
import 'package:test_app/model/characters_info.dart';
import 'package:test_app/service/api.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc() : super(CharactersLoadingState()) {
    on<LoadCharactersEvent>((event, emit) async {
      final response = await APIService.getCharacters();
      final List<Character> characters =
          response['characters'] as List<Character>;
      final CharactersInfo info = response['info'] as CharactersInfo;
      final hasReachedMax = info.next == '';
      emit(CharactersLoadedState(
          characters: characters, info: info, hasReachedMax: hasReachedMax));
    });
    on<LoadMoreEvent>((event, emit) async {
      if (!event.hasReachedMax) {
        final response = await APIService.getCharacters(url: event.next);
        final List<Character> characters =
            response['characters'] as List<Character>;
        final CharactersInfo info = response['info'] as CharactersInfo;
        final hasReachedMax = info.next == '';
        emit(CharactersLoadedState(
          characters: [...event.characters, ...characters], info: info, hasReachedMax: hasReachedMax));
      }
    });
  }
}
