import 'package:bmi_calculator/bmi_brain.dart';
import 'package:bmi_calculator/widgets/calculation_widget.dart';
import 'package:bmi_calculator/widgets/custom_widget.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final double bmiResults;

  const SecondPage({
    this.bmiResults,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 100.0,
              child: Text(
                'YOUR RESULT:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 160.0,
              left: 20.0,
              right: 20.0,
              bottom: 80.0,
              child: CustomWidget(
                widgetChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      BmiBrain.getResult(bmiResults),
                      style: TextStyle(
                        color: Colors.green[700],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      bmiResults.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      BmiBrain.getInterpretation(bmiResults),
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        //  Center(
        //   child: Text('Normal'),
        // ),
        bottomNavigationBar: CalculationWidget(
          calculationText: 'recalculate',
          ontap: () {
            Navigator.pop(context);
          },
        ));
  }
}
