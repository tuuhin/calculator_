import 'package:calculator/model/basecalc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StdCalcBoard extends StatefulWidget {
  final ValueChanged<String>? calc;
  final ValueChanged<String>? history;
  const StdCalcBoard({Key? key, this.calc, this.history}) : super(key: key);
  @override
  State<StdCalcBoard> createState() => _StdCalcBoardState();
}

class _StdCalcBoardState extends State<StdCalcBoard> {
  final BaseCalc _baseCalc = BaseCalc();
  String value = '0';
  final List<String> _operatorList = ['+', '-', '*', '/'];
  static const _buttonStyle =
      TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold);
  static const _buttonNumberStyle =
      TextStyle(fontSize: 25, fontWeight: FontWeight.bold);

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
                  value = '0';
                  widget.calc!.call(value);
                  _baseCalc.clearHistory();
                },
                child: const Text('CE', style: _buttonStyle)),
            TextButton(
                onPressed: () {
                  value = '0';
                  widget.calc!.call(value);
                },
                child: const Text('C', style: _buttonStyle)),
            TextButton(
                onPressed: () {
                  if (value.length > 1) {
                    value = value.substring(0, value.length - 1);
                    widget.calc!.call(value);
                  } else if (value.length == 1) {
                    widget.calc!.call('0');
                  }
                },
                child: const Text('\u2190', style: _buttonStyle)),
            TextButton(
                onPressed: () {
                  if (!_operatorList
                      .any((element) => value.endsWith(element))) {
                    value += '/';
                    widget.calc!.call(value);
                  }
                },
                child: const Text('\u00f7', style: _buttonStyle)),
            TextButton(
                onPressed: () {
                  value += '7';
                  widget.calc!.call(value);
                },
                child: const Text('7', style: _buttonNumberStyle)),
            TextButton(
                onPressed: () {
                  value += '8';
                  widget.calc!.call(value);
                },
                child: const Text('8', style: _buttonNumberStyle)),
            TextButton(
                onPressed: () {
                  value += '9';
                  widget.calc!.call(value);
                },
                child: const Text('9', style: _buttonNumberStyle)),
            TextButton(
                onPressed: () {
                  if (!_operatorList
                      .any((element) => value.endsWith(element))) {
                    if (value.isEmpty) {
                      value += '1';
                    }
                    value += '*';
                    widget.calc!.call((value));
                  }
                },
                child: const Text('x', style: _buttonStyle)),
            TextButton(
                onPressed: () {
                  value += '4';
                  widget.calc!.call(value);
                },
                child: const Text('4', style: _buttonNumberStyle)),
            TextButton(
                onPressed: () {
                  value += '5';
                  widget.calc!.call(value);
                },
                child: const Text('5', style: _buttonNumberStyle)),
            TextButton(
                onPressed: () {
                  value += '6';
                  widget.calc!.call(value);
                },
                child: const Text('6', style: _buttonNumberStyle)),
            TextButton(
                onPressed: () {
                  if (!_operatorList
                      .any((element) => value.endsWith(element))) {
                    if (value.isEmpty) {
                      value += '0';
                    }
                    value += '-';
                    widget.calc!.call(value);
                  }
                },
                child: const Text('-', style: _buttonStyle)),
            TextButton(
                onPressed: () {
                  value += '1';
                  widget.calc!.call(value);
                },
                child: const Text('1', style: _buttonNumberStyle)),
            TextButton(
                onPressed: () {
                  value += '2';
                  widget.calc!.call(value);
                },
                child: const Text('2', style: _buttonNumberStyle)),
            TextButton(
                onPressed: () {
                  value += '3';
                  widget.calc!.call(value);
                },
                child: const Text('3', style: _buttonNumberStyle)),
            TextButton(
                onPressed: () {
                  if (!_operatorList
                      .any((element) => value.endsWith(element))) {
                    if (value.isEmpty) {
                      value += '0';
                    }
                    value += '+';
                    widget.calc!.call(value);
                  }
                },
                child: const Text('+', style: _buttonStyle)),
            TextButton(onPressed: () {}, child: const SizedBox.shrink()),
            TextButton(
                onPressed: () {
                  print(value);
                  widget.calc!.call(value += '0');
                },
                child: const Text('0', style: _buttonNumberStyle)),
            TextButton(
                onPressed: () {
                  if (!value.contains('.')) {
                    value += '.';
                    widget.calc!.call(value);
                  }
                },
                child: const Text('.', style: _buttonStyle)),
            TextButton(
                onPressed: () {
                  if (value[0] == '-') {
                    value = '0' + value;
                  }
                  if (value.isNotEmpty) {
                    _baseCalc.compute(value);
                    value = _baseCalc.log.last[1];
                    widget.calc!.call(value);
                  }
                  print(_baseCalc.log);
                },
                child: const Text('=', style: _buttonStyle)),
          ],
        ),
      ),
    );
  }
}
