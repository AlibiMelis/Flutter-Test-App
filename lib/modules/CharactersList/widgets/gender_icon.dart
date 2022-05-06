import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app/model/character.dart';

class GenderIcon extends StatelessWidget {
  final Gender gender;
  final double size;
  final Color bgcolor;
  final Color color;
  const GenderIcon({
    Key? key,
    required this.gender,
    required this.size,
    this.color = Colors.black,
    this.bgcolor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<Gender, String> genderMap = {
      Gender.female: 'female.svg',
      Gender.male: 'male.svg',
      Gender.genderless: 'genderless.svg',
      Gender.unknown: 'unknown.svg',
    };

    return genderMap[gender] != null
        ? Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: bgcolor,
            ),
            child: SvgPicture.asset(
              'assets/${genderMap[gender]}',
              color: color,
              width: size,
              height: size,
              fit: BoxFit.contain,
            ),
          )
        : const SizedBox.shrink();
  }
}
