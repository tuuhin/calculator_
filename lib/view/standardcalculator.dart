import 'package:calculator/keyboards/keyboard.dart';
import 'package:calculator/widget/appdrawer.dart';
import 'package:flutter/material.dart';

class StandardCalculator extends StatefulWidget {
  const StandardCalculator({Key? key}) : super(key: key);

  @override
  State<StandardCalculator> createState() => _StandardCalculatorState();
}

class _StandardCalculatorState extends State<StandardCalculator> {
  String _caltext = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('std calculator')),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Text(_caltext),
          StdCalcBoard(
            calc: (String v) {
              print(v);
              setState(() {
                _caltext = v;
              });
            },
          )
        ],
      ),
    );
  }
}
