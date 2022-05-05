import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app/model/character.dart';

class GenderIcon extends StatelessWidget {
  final Gender gender;
  final double size;
  const GenderIcon({Key? key, required this.gender, required this.size}) : super(key: key);

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
            // decoration: const BoxDecoration(
            //   color: Colors.white,
            // ),
            child: SvgPicture.asset(
              'assets/${genderMap[gender]}',
              width: size,
              height: size,
              fit: BoxFit.contain,
            ),
          )
        : const SizedBox.shrink();
  }
}
