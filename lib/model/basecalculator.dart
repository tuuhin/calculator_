import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';

void main() {
  Parser p = Parser();
  Expression exp = p.parse('4+');
  ContextModel cm = ContextModel();
  double value = exp.evaluate(EvaluationType.REAL, cm);
  print(value);
}
