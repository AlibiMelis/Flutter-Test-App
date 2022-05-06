import 'package:flutter/material.dart';
import 'package:test_app/model/character.dart';
import 'package:test_app/modules/CharactersList/widgets/gender_icon.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  final VoidCallback onClick;
  CharacterCard({Key? key, required this.character, VoidCallback? onClick})
      : onClick = onClick ?? (() {}),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).hintColor,
      elevation: 4,
      child: InkWell(
        onTap: onClick,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              Flexible(
                flex: 3,
                child: Stack(
                  children: [
                    ClipRRect(
                      child: Image.network(character.image),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    Positioned(
                      right: 2.0,
                      bottom: 2.0,
                      child: GenderIcon(
                        gender: character.gender,
                        size: 18.0,
                        color: Colors.black87,
                        bgcolor: Theme.of(context).hintColor,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 4.0),
              Flexible(
                child: Text(
                  character.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
