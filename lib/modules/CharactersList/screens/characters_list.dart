import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/model/character.dart';
import 'package:test_app/modules/CharacterDetails/screens/character_details.dart';
import 'package:test_app/modules/CharactersList/bloc/characters_bloc.dart';
import 'package:test_app/modules/CharactersList/widgets/character_card.dart';

class CharactersList extends StatelessWidget {
  const CharactersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CharactersLoadedState) {
            final List<Character> characters = state.characters;
            return ListView.separated(
              padding: const EdgeInsets.all(12.0),
              itemCount: characters.length + 1,
              itemBuilder: (context, ind) {
                if (ind == characters.length) {
                  return ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CharactersBloc>(context).add(
                        LoadMoreEvent(
                          characters: characters,
                          next: state.info.next,
                          hasReachedMax: state.hasReachedMax,
                        ),
                      );
                    },
                    child: const Text('Load more'),
                  );
                }
                Character character = characters[ind];
                return Hero(
                  tag: character.image,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) =>
                              CharacterDetails(character: character),
                        ),
                      );
                    },
                    child: CharacterCard(character: characters[ind]),
                  ),
                );
              },
              separatorBuilder: (context, ind) {
                return const SizedBox(height: 12.0);
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
