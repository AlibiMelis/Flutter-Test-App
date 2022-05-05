import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_app/model/characters_repo.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc() : super(CharactersLoading()) {
    on<CharactersEvent>((event, emit) {

    });
  }
}
