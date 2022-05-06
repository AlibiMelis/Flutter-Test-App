import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/model/character.dart';
import 'package:test_app/modules/CharacterDetails/screens/character_details.dart';
import 'package:test_app/modules/CharactersList/bloc/characters_bloc.dart';
import 'package:test_app/modules/CharactersList/widgets/character_card.dart';

class CharactersList extends StatelessWidget {
  CharactersList({Key? key}) : super(key: key);
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
        elevation: 0,
      ),
      body: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CharactersLoadedState) {
            final List<Character> characters = state.characters;
            return NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollEndNotification &&
                    _scrollController.position.extentAfter == 0) {
                  BlocProvider.of<CharactersBloc>(context).add(
                    LoadMoreEvent(
                      characters: characters,
                      next: state.info.next,
                      hasReachedMax: state.hasReachedMax,
                    ),
                  );
                }
                return false;
              },
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8.0),
                      itemCount: characters.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.70,
                        crossAxisCount: 3,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemBuilder: (context, ind) {
                        Character character = characters[ind];
                        return Hero(
                          tag: character.image,
                          child: CharacterCard(
                            character: characters[ind],
                            onClick: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) =>
                                      CharacterDetails(character: character),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                    !state.hasReachedMax
                        ? const CircularProgressIndicator()
                        : Text('You have reached the end.',
                            style: Theme.of(context).textTheme.subtitle1)
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: Text('Oups, something went wrong!'),
          );
        },
      ),
    );
  }
}
