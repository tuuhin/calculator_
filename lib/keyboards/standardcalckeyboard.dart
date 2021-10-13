import 'package:calculator/model/basecalculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  static const _buttonStyle =
      TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold);
  static const _buttonNumberStyle =
      TextStyle(fontSize: 25, fontWeight: FontWeight.bold);

  final BaseCalculator _calc = BaseCalculator();

  bool _check(String eval) {
    return !_operators.any((element) => eval.endsWith(element)) &&
        eval.isNotEmpty;
  }

  bool _allowed(String op) {
    return op == 'Nan' ? true : false;
  }

  void valueOnNumber(String op) {
    widget.output!.call(_calc.calculate(op, log: false).toString());
  }

  String _input = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * .45,
      // color: Colors.blue,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        child: Wrap(
          runSpacing: 15,
          spacing: 15,
          children: [
            TextButton(
                onPressed: () {
                  _input = '';
                  _calc.logs.clear();
                  widget.history!.call(_calc.logs);
                  widget.input!.call(_input);
                  widget.output!.call(_input);
                },
                child: const Text('CE', style: _buttonStyle)),
            TextButton(
                onPressed: () {
                  _input = '';
                  widget.input!.call(_input);
                  widget.output!.call(_input);
                },
                child: const Text('C', style: _buttonStyle)),
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
                child: const Text('\u2190', style: _buttonStyle)),
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
                child: const Text('\u00f7', style: _buttonStyle)),
            TextButton(
                onPressed: () {
                  if (_allowed(_input)) {
                    _input = '';
                  }
                  _input += '7';
                  widget.input!.call(_input);
                  valueOnNumber(_input);
                },
                child: const Text('7', style: _buttonNumberStyle)),
            TextButton(
                onPressed: () {
                  if (_allowed(_input)) {
                    _input = '';
                  }
                  _input += '8';
                  widget.input!.call(_input);
                  valueOnNumber(_input);
                },
                child: const Text('8', style: _buttonNumberStyle)),
            TextButton(
                onPressed: () {
                  if (_allowed(_input)) {
                    _input = '';
                  }
                  _input += '9';
                  widget.input!.call(_input);
                  valueOnNumber(_input);
                },
                child: const Text('9', style: _buttonNumberStyle)),
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
                child: const Text('x', style: _buttonStyle)),
            TextButton(
                onPressed: () {
                  if (_allowed(_input)) {
                    _input = '';
                  }
                  _input += '4';
                  widget.input!.call(_input);
                  valueOnNumber(_input);
                },
                child: const Text('4', style: _buttonNumberStyle)),
            TextButton(
                onPressed: () {
                  if (_allowed(_input)) {
                    _input = '';
                  }
                  _input += '5';
                  widget.input!.call(_input);
                  valueOnNumber(_input);
                },
                child: const Text('5', style: _buttonNumberStyle)),
            TextButton(
                onPressed: () {
                  if (_allowed(_input)) {
                    _input = '';
                  }
                  _input += '6';
                  widget.input!.call(_input);
                  valueOnNumber(_input);
                },
                child: const Text('6', style: _buttonNumberStyle)),
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
                child: const Text('-', style: _buttonStyle)),
            TextButton(
                onPressed: () {
                  if (_allowed(_input)) {
                    _input = '';
                  }
                  _input += '1';
                  widget.input!.call(_input);
                  valueOnNumber(_input);
                },
                child: const Text('1', style: _buttonNumberStyle)),
            TextButton(
                onPressed: () {
                  if (_allowed(_input)) {
                    _input = '';
                  }
                  _input += '2';
                  widget.input!.call(_input);
                  valueOnNumber(_input);
                },
                child: const Text('2', style: _buttonNumberStyle)),
            TextButton(
                onPressed: () {
                  if (_allowed(_input)) {
                    _input = '';
                  }
                  _input += '3';
                  widget.input!.call(_input);
                  valueOnNumber(_input);
                },
                child: const Text('3', style: _buttonNumberStyle)),
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
                child: const Text('+', style: _buttonStyle)),
            TextButton(onPressed: () {}, child: const SizedBox.shrink()),
            TextButton(
                onPressed: () {
                  if (_allowed(_input)) {
                    _input = '';
                  }
                  _input += '0';
                  widget.input!.call(_input);
                  valueOnNumber(_input);
                },
                child: const Text('0', style: _buttonNumberStyle)),
            TextButton(
                onPressed: () {
                  if (_allowed(_input)) {
                    _input = '';
                  }
                  _input += '.';
                  widget.input!.call(_input);
                  valueOnNumber(_input);
                },
                child: const Text('.', style: _buttonStyle)),
            TextButton(
                onPressed: () {
                  _calc.calculate(_input);
                  // print(_calc.logs);
                  widget.history!.call(_calc.logs);
                  widget.input!.call(_calc.logs.last[1]);
                  widget.output!.call(_calc.logs.last[1]);
                  _input = _calc.logs.last[1];
                },
                child: const Text('=', style: _buttonStyle)),
          ],
        ),
      ),
    );
  }
}
