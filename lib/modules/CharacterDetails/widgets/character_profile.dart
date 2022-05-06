import 'package:flutter/material.dart';
import 'package:test_app/model/character.dart';

class CharacterProfile extends StatelessWidget {
  final String name;
  final Gender gender;
  final Status status;
  final String image;

  const CharacterProfile(
      {Key? key,
      required this.name,
      required this.gender,
      required this.status,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Row(
        children: [
          Hero(
            tag: image,
            child: Image.network(
              image,
              height: 120.0,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(gender.name.toUpperCase(),
                        style: Theme.of(context).textTheme.headline1),
                    Text('gender',
                        style: Theme.of(context).textTheme.subtitle1),
                  ],
                ),
                Column(
                  children: [
                    Text(status.name.toUpperCase(),
                        style: Theme.of(context).textTheme.headline1),
                    Text('status',
                        style: Theme.of(context).textTheme.subtitle1),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
