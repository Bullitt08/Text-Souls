import 'package:staj2/functions/Calculator.dart';

class dpCalculator extends Calculator {
  @override
  double calculator(double point1, double point2) {
    return (point1 * 10) + (point2 * 2);
  }
}