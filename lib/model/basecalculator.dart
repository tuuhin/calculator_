import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';

class BaseCalculator {
  static final Parser _par = Parser();
  static final List<String> _operators = ['+', '-', '*', '\u00f7'];
  List logs = [];
  static final ContextModel _model = ContextModel();

  calculate(String eval, {bool log = true}) {
    // print(eval);
    try {
      Expression _exp = _par.parse(eval);
      double _return = _exp.evaluate(EvaluationType.REAL, _model);
      if (log) {
        logs.add([eval, _return.toString()]);
      }
      return _return;
    } catch (e) {
      print(e.toString());
      if (log) logs.add([eval, 'Error']);
      return 'Error';
    }
  }

  double? _sqrt(double? op) => op != null ? math.sqrt(op) : null;

  getSqrt(String eval) {
    if (_operators.any((element) => eval.endsWith(element))) {
      String _lastOperand =
          _sqrt(calculate(eval.substring(0, eval.length - 1), log: false))
              .toString();
      double? _ans = calculate(eval + _lastOperand, log: false);
      logs.add({'$eval sqrt(${eval.substring(0, eval.length - 1)})', _ans});
      return _ans;
    } else {
      double? _ans = _sqrt(calculate(eval, log: false));
      logs.add({'sqrt($eval)', _ans});
      return _ans;
    }
  }

  getInverse(String eval) {
    return calculate('${calculate(eval, log: false)}*-1');
  }

  getPower(String eval) {
    if (_operators.any((element) => eval.endsWith(element))) {
      String _lastOperand =
          calculate(eval.substring(0, eval.length - 1) + '^2', log: false)
              .toString();
      double? _ans = calculate(eval + _lastOperand, log: false);
      logs.add({'$eval sqr(${eval.substring(0, eval.length - 1)})', _ans});
      return _ans;
    } else {
      double? _ans = (calculate('($eval)^2', log: false));
      logs.add(['sqrt($eval)', _ans]);
      return _ans;
    }
  }

  getRecp(String eval) {
    if (_operators.any((element) => eval.endsWith(element))) {
      String _lastOperand =
          calculate('1/${eval.substring(0, eval.length - 1)}', log: false)
              .toString();
      double? _ans = calculate(eval + _lastOperand, log: false);
      logs.add({'$eval recp(${eval.substring(0, eval.length - 1)})', _ans});
      return _ans;
    } else {
      double? _ans = (calculate('1/($eval)', log: false));
      logs.add({'recp($eval)', _ans});
      return _ans;
    }
  }
}
