import 'package:calculator/data/calculate/basecalculator.dart';
import 'package:calculator/ui/theme/pallette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class StdCalcBoard extends StatefulWidget {
  final ValueChanged<String>? input;
  final ValueChanged<String>? output;
  final ValueChanged<List>? history;
  const StdCalcBoard({Key? key, this.input, this.output, this.history})
      : super(key: key);
  @override
  State<StdCalcBoard> createState() => _StdCalcBoardState();
}

class _StdCalcBoardState extends State<StdCalcBoard> {
  static final List<String> _operators = ['+', '-', '*', '/'];

  final BaseCalculator _calc = BaseCalculator();

  bool _check(String eval) {
    return !_operators.any((element) => eval.endsWith(element)) &&
        eval.isNotEmpty;
  }

  bool _allowed(String op) {
    return op == 'NaN' ? true : false;
  }

  void valueOnNumber(String op) {
    widget.output!.call(_calc.calculate(op, log: false));
  }

  String _input = '';

  @override
  Widget build(BuildContext context) {
    TextStyle _buttonNumber = Palette.numberStyle
        .copyWith(color: Theme.of(context).textTheme.bodyText1!.color);
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),

      // color: Colors.blue,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    _calc.getPower(_input);

                    widget.history!.call(_calc.logs);
                    widget.input!.call(_calc.logs.last[1]);
                    widget.output!.call(_calc.logs.last[1]);
                    _input = _calc.logs.last[1];
                  },
                  child: Text('x\u00b2', style: Palette.singleOperandButton)),
              TextButton(
                  onPressed: () {
                    _calc.getSqrt(_input);

                    widget.history!.call(_calc.logs);
                    widget.input!.call(_calc.logs.last[1]);
                    widget.output!.call(_calc.logs.last[1]);
                    _input = _calc.logs.last[1];
                  },
                  child: Text('\u221a', style: Palette.singleOperandButton)),
              TextButton(
                  onPressed: () {
                    _calc.getInverse(_input);

                    widget.history!.call(_calc.logs);
                    widget.input!.call(_calc.logs.last[1]);
                    widget.output!.call(_calc.logs.last[1]);
                    _input = _calc.logs.last[1];
                  },
                  child: Text('\u00b1', style: Palette.singleOperandButton)),
              TextButton(
                  onPressed: () {
                    if (_input != '0' && _input.isNotEmpty) {
                      _calc.getRecp(_input);

                      widget.history!.call(_calc.logs);
                      widget.input!.call(_calc.logs.last[1]);
                      widget.output!.call(_calc.logs.last[1]);
                      _input = _calc.logs.last[1];
                    } else {
                      _calc.logs.add(['1/x', 'cant divide by zero']);
                      widget.history!.call(_calc.logs);
                    }
                  },
                  child: Text('1/x', style: Palette.singleOperandButton)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    _input = '';
                    _calc.logs.clear();
                    widget.history!.call(_calc.logs);
                    widget.input!.call(_input);
                    widget.output!.call(_input);
                  },
                  child: Text('CE', style: Palette.removalButton)),
              TextButton(
                  onPressed: () {
                    _input = '';
                    widget.input!.call(_input);
                    widget.output!.call(_input);
                  },
                  child: Text('C', style: Palette.removalButton)),
              TextButton(
                  onPressed: () {
                    if (_input.length == 1) {
                      _input = '0';
                    } else if (_input.length > 1) {
                      _input = _input.substring(0, _input.length - 1);
                    }

                    widget.input!.call(_input);
                    if (!_check(_input)) {
                      valueOnNumber(_input.substring(0, _input.length - 1));
                    } else {
                      valueOnNumber(_input);
                    }
                  },
                  child: Text('<', style: Palette.removalButton)),
              TextButton(
                  onPressed: () {
                    if (_allowed(_input)) {
                      _input = '';
                    }
                    if (_check(_input)) {
                      _input += '/';
                    }
                    widget.input!.call(_input);
                  },
                  child: Text('\u00f7', style: Palette.twoOpereandStyle)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    if (_allowed(_input)) {
                      _input = '';
                    }
                    _input += '7';
                    widget.input!.call(_input);
                    valueOnNumber(_input);
                  },
                  child: Text('7', style: _buttonNumber)),
              TextButton(
                  onPressed: () {
                    if (_allowed(_input)) {
                      _input = '';
                    }
                    _input += '8';
                    widget.input!.call(_input);
                    valueOnNumber(_input);
                  },
                  child: Text('8', style: _buttonNumber)),
              TextButton(
                  onPressed: () {
                    if (_allowed(_input)) {
                      _input = '';
                    }
                    _input += '9';
                    widget.input!.call(_input);
                    valueOnNumber(_input);
                  },
                  child: Text('9', style: _buttonNumber)),
              TextButton(
                  onPressed: () {
                    if (_allowed(_input)) {
                      _input = '';
                    }
                    if (_check(_input)) {
                      _input += '*';
                    }
                    widget.input!.call(_input);
                  },
                  child: Text('\u00d7', style: Palette.twoOpereandStyle)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    if (_allowed(_input)) {
                      _input = '';
                    }
                    _input += '4';
                    widget.input!.call(_input);
                    valueOnNumber(_input);
                  },
                  child: Text('4', style: _buttonNumber)),
              TextButton(
                  onPressed: () {
                    if (_allowed(_input)) {
                      _input = '';
                    }
                    _input += '5';
                    widget.input!.call(_input);
                    valueOnNumber(_input);
                  },
                  child: Text('5', style: _buttonNumber)),
              TextButton(
                  onPressed: () {
                    if (_allowed(_input)) {
                      _input = '';
                    }
                    _input += '6';
                    widget.input!.call(_input);
                    valueOnNumber(_input);
                  },
                  child: Text('6', style: _buttonNumber)),
              TextButton(
                  onPressed: () {
                    if (_allowed(_input)) {
                      _input = '';
                    }
                    if (_check(_input)) {
                      _input += '-';
                    }
                    widget.input!.call(_input);
                  },
                  child: Text('\u2212', style: Palette.twoOpereandStyle)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    if (_allowed(_input)) {
                      _input = '';
                    }
                    _input += '1';
                    widget.input!.call(_input);
                    valueOnNumber(_input);
                  },
                  child: Text('1', style: _buttonNumber)),
              TextButton(
                  onPressed: () {
                    if (_allowed(_input)) {
                      _input = '';
                    }
                    _input += '2';
                    widget.input!.call(_input);
                    valueOnNumber(_input);
                  },
                  child: Text('2', style: _buttonNumber)),
              TextButton(
                  onPressed: () {
                    if (_allowed(_input)) {
                      _input = '';
                    }
                    _input += '3';
                    widget.input!.call(_input);
                    valueOnNumber(_input);
                  },
                  child: Text('3', style: _buttonNumber)),
              TextButton(
                  onPressed: () {
                    if (_allowed(_input)) {
                      _input = '';
                    }
                    if (_check(_input)) {
                      _input += '+';
                    }
                    widget.input!.call(_input);
                  },
                  child: Text('\u002b', style: Palette.twoOpereandStyle)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox.square(dimension: 65),
              TextButton(
                  onPressed: () {
                    if (_allowed(_input)) {
                      _input = '';
                    }
                    _input += '0';
                    widget.input!.call(_input);
                    valueOnNumber(_input);
                  },
                  child: Text('0', style: _buttonNumber)),
              TextButton(
                  onPressed: () {
                    if (_allowed(_input)) {
                      _input = '';
                    }
                    _input += '.';
                    widget.input!.call(_input);
                    valueOnNumber(_input);
                  },
                  child: Text('.', style: _buttonNumber)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(elevation: 0),
                  onPressed: () {
                    _calc.calculate(_input);
                    widget.history!.call(_calc.logs);
                    widget.input!.call(_calc.logs.last[1]);
                    widget.output!.call(_calc.logs.last[1]);
                    _input = _calc.logs.last[1];
                  },
                  child: const Text('=', style: Palette.equalsToStyle)),
            ],
          ),
        ],
      ),
    );
  }
}
