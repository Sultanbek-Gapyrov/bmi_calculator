import 'dart:math' as math;

class BmiBrain {
  //  _bmi = _weight / math.pow(_height / 100, 2);
  // weight (lb) / [height (in)]2 x 703
  static double calculateBmi({int weight, int height}) {
    final bmi = weight / math.pow(height / 100, 2);

    return bmi;
  }

  static String getResult(double _bmi) {
    // try {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
    // } catch (e) {
    //   throw Exception(e);
    // }
  }

  static String getInterpretation(double _bmi) {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. You should exercise more';
    } else if (_bmi > 18.5) {
      return 'You have a normal bodu weight. Good job';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
  }
}

// BmiBrain bmiBrain = BmiBrain();
