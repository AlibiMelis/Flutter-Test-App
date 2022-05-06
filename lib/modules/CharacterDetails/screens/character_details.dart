import 'package:flutter/material.dart';
import 'package:test_app/model/character.dart';
import 'package:test_app/model/episode.dart';
import 'package:test_app/modules/CharacterDetails/widgets/character_profile.dart';
import 'package:test_app/service/api.dart';

class CharacterDetails extends StatelessWidget {
  final Character character;
  const CharacterDetails({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        elevation: 0,
      ),
      body: Column(
        children: [
          CharacterProfile(
            name: character.name,
            gender: character.gender,
            status: character.status,
            image: character.image,
          ),
          FutureBuilder<List<Episode>>(
            future: APIService.getEpisodes(character.episode),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || snapshot.hasError) {
                return const Center(
                  child: Text('Sorry, couldn\'t load episodes'),
                );
              }
              List<Episode> episodes = snapshot.data;
              return Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(12.0),
                  itemCount: episodes.length + 1,
                  itemBuilder: (context, ind) {
                    if (ind == 0) {
                      return Text('Appeared in:',
                          style: Theme.of(context).textTheme.headline1);
                    }
                    Episode e = episodes[ind - 1];
                    return Text('Episode ${e.episode}: ${e.name}');
                  },
                  separatorBuilder: (context, ind) {
                    if (ind == 0) return const SizedBox(height: 12.0);
                    return const Divider();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
