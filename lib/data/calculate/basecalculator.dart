import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';
import 'package:intl/intl.dart';

class BaseCalculator {
  static final Parser _par = Parser();
  static final List<String> _operators = ['+', '-', '*', '/'];
  List logs = [];
  static final ContextModel _model = ContextModel();

  calculate(String eval, {bool log = true}) {
    try {
      Expression _exp = _par.parse(eval);
      num _value = _exp.evaluate(EvaluationType.REAL, _model);
      String _ans =
          NumberFormat(_value != _value.round() ? '.####' : '#', 'en_US')
              .format(_value);

      if (log) {
        logs.add([eval, _ans]);
      }
      return _ans;
    } catch (e) {
      print(e.toString());
      if (log) logs.add([eval, 'Error']);
      return 'Error';
    }
  }

  double? _sqrt(String? op) => op != null ? math.sqrt(num.parse(op)) : null;

  getSqrt(String eval) {
    if (_operators.any((element) => eval.endsWith(element))) {
      String _lastOperand =
          _sqrt(calculate(eval.substring(0, eval.length - 1), log: false))
              .toString();
      String? _ans = calculate(eval + _lastOperand, log: false);
      logs.add(['$eval sqrt(${eval.substring(0, eval.length - 1)})', _ans]);
      return _ans;
    } else {
      double? _value = _sqrt(calculate(eval, log: false));
      String _ans = NumberFormat.decimalPattern().format(_value);
      logs.add(['sqrt($eval)', _ans]);
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
      String? _ans = calculate(eval + _lastOperand, log: false);
      logs.add(['$eval sqr(${eval.substring(0, eval.length - 1)})', _ans]);
      return _ans;
    } else {
      String? _ans = (calculate('($eval)^2', log: false));
      logs.add(['$eval' '\u00b2', _ans]);
      return _ans;
    }
  }

  getRecp(String eval) {
    if (_operators.any((element) => eval.endsWith(element))) {
      String _lastOperand =
          calculate('1/${eval.substring(0, eval.length - 1)}', log: false)
              .toString();
      String? _ans = calculate(eval + _lastOperand, log: false);
      logs.add(['$eval recp(${eval.substring(0, eval.length - 1)})', _ans]);
      return _ans;
    } else {
      String? _ans = calculate('1/($eval)', log: false);
      logs.add(['1/($eval)', _ans]);
      return _ans;
    }
  }
}
