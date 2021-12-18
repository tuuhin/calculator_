import 'package:calculator/ui/drawer/appdrawer.dart';
import 'package:calculator/ui/keyboards/keyboard.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class StandardCalculator extends StatefulWidget {
  const StandardCalculator({Key? key}) : super(key: key);

  @override
  State<StandardCalculator> createState() => _StandardCalculatorState();
}

class _StandardCalculatorState extends State<StandardCalculator> {
  String _input = '';
  String _outputs = '';
  List _logs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Standard')),
      drawer: AppDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: DecoratedBox(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                reverse: true,
                itemCount: _logs.length,
                itemBuilder: (context, i) => Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Text(
                            '${_logs[i][0]} = ${_logs[i][1]}'
                                .replaceAll(RegExp(r'/'), '\u00f7')
                                .replaceAll(r'*', '\u00d7'),
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(
                                    fontSize: 15, fontWeight: FontWeight.w500)),
                      ),
                    )),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                  _input != ''
                      ? _input
                          .replaceAll(RegExp(r'/'), '\u00f7')
                          .replaceAll(r'*', '\u00d7')
                      : '0',
                  style: Theme.of(context).textTheme.headline5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(_outputs != '' ? '= ' + _outputs : '0',
                  style: Theme.of(context).textTheme.headline4),
            ),
          ),
          const Divider(),
          StdCalcBoard(
            output: (output) {
              setState(() {
                _outputs = output;
              });
            },
            history: (logs) {
              setState(() {
                _logs = logs.reversed.toList();
              });
            },
            input: (input) {
              setState(() {
                _input = input;
              });
            },
          )
        ],
      ),
    );
  }
}
