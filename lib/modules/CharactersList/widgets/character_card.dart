import 'package:flutter/material.dart';
import 'package:test_app/model/character.dart';
import 'package:test_app/modules/CharactersList/widgets/gender_icon.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  const CharacterCard({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 20.0),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            child: Image.network(character.image, width: 52.0, height: 52.0),
            borderRadius: BorderRadius.circular(12.0),
          ),
          const SizedBox(width: 12.0),
          Expanded(child: Text(character.name)),
          const SizedBox(width: 12.0),
          GenderIcon(gender: character.gender, size: 36.0),
        ],
      ),
    );
  }
}
