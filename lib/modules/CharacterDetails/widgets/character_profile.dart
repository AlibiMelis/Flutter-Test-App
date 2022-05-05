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
    return Padding(
      padding: const EdgeInsets.all(12.0),
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
                    Text(gender.name),
                    const Text('gender'),
                  ],
                ),
                Column(
                  children: [
                    Text(status.name),
                    const Text('status'),
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
