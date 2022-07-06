import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AgeWeightWidget extends StatelessWidget {
  final void Function() onpressedMinus;
  final void Function() onpressedPlus;
  final String weightageNumber;
  final String weightageText;

  AgeWeightWidget({
    this.onpressedPlus,
    this.weightageText,
    this.onpressedMinus,
    this.weightageNumber,
    key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          weightageText,
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              weightageNumber,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 97, 143, 180),
                shape: CircleBorder(),
              ),
              onPressed: onpressedMinus,
              child: FaIcon(
                FontAwesomeIcons.minus,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 97, 143, 180),
                shape: CircleBorder(),
              ),
              onPressed: onpressedPlus,
              child: FaIcon(
                FontAwesomeIcons.plus,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
