import 'package:flutter/material.dart';

class CalculationWidget extends StatelessWidget {
  final String calculationText;
  final void Function() ontap;
  const CalculationWidget({
    this.ontap,
    this.calculationText,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        child: Text(
          calculationText.toUpperCase(),
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.08,
        width: double.infinity,
        color: Colors.pink[800],
      ),
    );
  }
}
