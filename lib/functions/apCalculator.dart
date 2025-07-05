import 'package:staj2/functions/Calculator.dart';

class apCalculator extends Calculator {
  @override
  double calculator(double point1, double point2) {
    return (point1 * 7.5) + (point2 * 4);
  }
}
