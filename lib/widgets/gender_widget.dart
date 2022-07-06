import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({
    Key key,
    this.genderIcon,
    this.genderText,
  }) : super(key: key);

  final IconData genderIcon;
  final String genderText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FaIcon(
          genderIcon,
          size: 60,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          genderText.toUpperCase(),
          style: TextStyle(
            fontSize: 25,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
