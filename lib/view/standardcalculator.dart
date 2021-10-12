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
  String _expresion = '';
  String removeZero(String str) {
    if (str.startsWith('0')) {
      return str.substring(1);
    } else {
      return str;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('std calculator')),
      drawer: AppDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(removeZero(_expresion),
              style:
                  const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          Text(removeZero(_caltext),
              style:
                  const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          Column(
            children: [
              const Divider(),
              StdCalcBoard(
                history: (String h) {
                  setState(() {
                    _expresion = h;
                  });
                },
                calc: (String v) {
                  setState(() {
                    _caltext = v;
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
