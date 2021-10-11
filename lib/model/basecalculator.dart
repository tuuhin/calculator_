import 'dart:math' as math;

class BaseCalculator {
  Set twoArgsFunc = {'+', '-', '*', '/'};
  Set oneAgrFunc = {'root', 'recp', 'sqrt'};
  String rawStr = '';
  String operand = '';
  List log = [];
  List sList = [];
  int lcd = 0;
  double reg1 = 0.0;
  double reg2 = 0.0;
  bool regSet1 = false;
  bool regSet2 = false;

  void clear() {
    rawStr = ' ';
    sList = [];
    reg1 = 0;
    regSet1 = false;
    reg2 = 0;
    regSet2 = false;
    operand = '';
    log = [];
    lcd = 0;
  }

  void logInfo(String message) {
    log.add(message);
  }

  void logState() {
    String state = 'state -> r1:$reg1 ,op:$operand, r2:$reg2';
    logInfo(state);
  }

  void ignore(String i) {
    logInfo('ignored $i');
  }

  void compute() {
    logState();
    if (!regSet1) reg1 = 0;
    if (!regSet2) reg2 = 0;
    logInfo('conpute');
    try {
      if (operand == '+') {
        reg1 = reg1 + reg2;
      } else if (operand == '-') {
        reg1 = reg1 - reg2;
      } else if (operand == '*') {
        reg1 = reg1 * reg2;
      } else if (operand == '/') {
        reg1 = reg1 / reg2;
      } else if (operand == 'root') {
        reg1 = math.sqrt(reg1);
      } else if (operand == 'sqrt') {
        reg1 = math.pow(reg1, 2).toDouble();
      } else if (operand == 'recp') {
        reg1 = double.parse((1 / reg1).toStringAsFixed(4));
      }
      regSet2 = false;
      operand = '';
    } catch (e) {
      reg1 = 0;
      regSet1 = false;
      regSet2 = false;
      print(e.toString());
    }
    logState();
    logInfo('results$reg1');
  }

  void run(String input) {
    rawStr = input;
    sList = input.split(' ');
    logInfo('input $rawStr');
    logInfo('input list$sList');
    while (true) {
      logState();
      if (sList.isEmpty) {
        if (operand.isEmpty) {
          break;
        } else {
          compute();
          break;
        }
      }
      var chunk = sList[0];
      sList = sList.sublist(1);
      if (twoArgsFunc.contains(chunk)) {
        if (regSet1 && !regSet2) {
          operand = chunk;
        } else if (regSet1 && regSet2) {
          compute();
          operand = chunk;
        } else {
          ignore(chunk);
        }
      } else if (oneAgrFunc.contains(chunk)) {
        if (regSet1 && !regSet2) {
          compute();
          operand = chunk;
        } else if (regSet1 && regSet2) {
          compute();
          operand = chunk;
          compute();
        } else {
          ignore(chunk);
        }
      } else {
        try {
          double number = double.parse(chunk);
          if (regSet1 && operand.isNotEmpty && !regSet2) {
            reg2 = number;
            regSet2 = true;
          } else if (regSet1 && operand.isNotEmpty && regSet2) {
            compute();
            reg1 = number;
            regSet1 = true;
            regSet2 = false;
          } else {
            reg1 = number;
            regSet1 = true;
          }
        } catch (e) {
          print(e.toString());
          ignore(chunk);
        }
      }
    }
  }
}

void main() {
  BaseCalculator calc = BaseCalculator();
  calc.run('72 - 32 * 21 + 31');
  calc.log.forEach((element) {
    print(element);
  });
}
