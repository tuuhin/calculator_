class BaseCalc {
  List _operands = [];
  List _operations = [];
  List log = [];
  num add(String op1, String op2) => num.parse(op1) + num.parse(op2);
  num subtract(String op1, String op2) => num.parse(op1) - num.parse(op2);
  num multiply(String op1, String op2) => num.parse(op1) * num.parse(op2);
  num divide(String op1, String op2) => num.parse(op1) / num.parse(op2);

  void logHistory(String header, String message) => log.add([header, message]);
  void clearHistory() {
    log.clear();
    _operands.clear();
    _operands.clear();
  }

  void compute(String eval) {
    _operands = eval.split(RegExp(r'[^0-9\.]'));
    _operations = eval.split(RegExp(r'[0-9\.]'));
    _operations.removeWhere((element) => element.isEmpty);
    _operands.removeWhere((e) => e.isEmpty);
    if (_operands.length == _operations.length) {
      _operations.removeLast();
    }
    print('$_operands, $_operations');
    try {
      run(_operands, _operations);
      logHistory(eval, '${_operands[0]}');
      // need to check weatther er need to clear the _operands andf _operation liust
    } catch (e) {
      print(e.toString());
      logHistory('error', e.toString());
    }
    _operands.clear();
    _operations.clear();
  }

  void run(List operands, List operations) {
    //checking for all the divides and then reducing it
    int divideCount = 0;
    while (true) {
      if (!operations.contains('/')) {
        break;
      } else {
        if (operations[divideCount] == '/') {
          operands[divideCount] =
              divide(operands[divideCount], operands[divideCount + 1])
                  .toString();
          operations.remove(operations[divideCount]);
          operands.remove(operands[divideCount + 1]);
        } else {
          divideCount += 1;
        }
      }
    }
    int multiCount = 0;
    while (true) {
      if (!operations.contains('*')) {
        break;
      } else {
        if (operations[multiCount] == '*') {
          operands[multiCount] =
              multiply(operands[multiCount], operands[multiCount + 1])
                  .toString();
          operations.remove(operations[multiCount]);
          operands.remove(operands[multiCount + 1]);
        } else {
          multiCount += 1;
        }
      }
    }

    while (true) {
      if (operations.isEmpty) {
        break;
      } else if (operations[0] == '+') {
        operands[0] = add(operands[0], operands[1]).toString();
        operations.remove(operations[0]);
        operands.remove(operands[1]);
      } else if (operations[0] == '-') {
        operands[0] = subtract(operands[0], operands[1]).toString();

        operations.remove(operations[0]);
        operands.remove(operands[1]);
      }
    }
  }
}
