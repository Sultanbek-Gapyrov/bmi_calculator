import 'package:bmi_calculator/bmi_brain.dart';
import 'package:bmi_calculator/second_page.dart';
import 'package:bmi_calculator/widgets/calculation_widget.dart';
import 'package:bmi_calculator/widgets/custom_widget.dart';
import 'package:bmi_calculator/widgets/gender_widget.dart';
import 'package:bmi_calculator/widgets/weight_age_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  MALE,
  FEMALE,
  NONE,
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff111427),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double heightvalue = 170;
  int weight = 55;
  int age = 19;
  Color selectedColor = const Color.fromARGB(255, 6, 65, 87);
  Color unselectedColor = const Color(0xff393b4b);
  Gender gender = Gender.NONE;

  // bool maleColor = false;
  // bool femaleColor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111427),
      appBar: AppBar(
        backgroundColor: Color(0xff111427),
        elevation: 0.0,
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Stack(
        // alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Positioned(
            top: 10.0,
            left: 20.0,
            child: CustomWidget(
              color: gender == Gender.MALE ? selectedColor : unselectedColor,
              widgetChild: InkWell(
                onTap: () {
                  setState(() {
                    //  maleColor = true;
                    // maleColor = !maleColor;
                    // femaleColor = false;
                    gender = Gender.MALE;
                  });
                },
                child: GenderWidget(
                  genderText: 'male',
                  genderIcon: FontAwesomeIcons.mars,
                ),
              ),
            ),
          ),
          Positioned(
            top: 10.0,
            right: 20,
            child: InkWell(
              onTap: () {
                setState(() {
                  // femaleColor = true;
                  // femaleColor = !femaleColor;
                  // maleColor = false;
                  gender = Gender.FEMALE;
                });
              },
              child: CustomWidget(
                color:
                    gender == Gender.FEMALE ? selectedColor : unselectedColor,
                widgetChild: GenderWidget(
                  genderText: 'female',
                  genderIcon: FontAwesomeIcons.venus,
                ),
              ),
            ),
          ),
          Positioned(
            top: 190.0,
            left: 20.0,
            right: 20.0,
            child: CustomWidget(
              widgetChild: Column(
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        heightvalue.toStringAsFixed(1),
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                      Text('cm'),
                    ],
                  ),
                  Slider(
                    min: 60,
                    max: 230,
                    value: heightvalue,
                    onChanged: (value) {
                      setState(() {
                        heightvalue = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 370,
            left: 20,
            child: CustomWidget(
              widgetChild: AgeWeightWidget(
                weightageText: 'WEIHGT',
                weightageNumber: weight.toString(),
                onpressedMinus: () {
                  setState(() {
                    weight--;
                  });
                },
                onpressedPlus: () {
                  setState(() {
                    weight++;
                  });
                },
              ),
            ),
          ),
          Positioned(
            top: 370,
            right: 20,
            child: CustomWidget(
              widgetChild: AgeWeightWidget(
                weightageText: 'AGE',
                weightageNumber: age.toString(),
                onpressedMinus: () {
                  setState(() {
                    age--;
                  });
                },
                onpressedPlus: () {
                  setState(() {
                    age++;
                  });
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CalculationWidget(
        calculationText: 'CALCULATe',
        ontap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => SecondPage(
                    bmiResults: BmiBrain.calculateBmi(
                      weight: weight,
                      height: heightvalue.toInt(),
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }
}
