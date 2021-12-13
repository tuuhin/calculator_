import 'package:calculator/ui/theme/pallette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScientificBoard extends StatelessWidget {
  const ScientificBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * .6,
      // color: Colors.blue,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Rad')),
              ElevatedButton(onPressed: () {}, child: const Text('Hypn')),
              ElevatedButton(onPressed: () {}, child: const Text('F-E')),
            ],
          ),
          Wrap(
            children: [
              TextButton(
                  onPressed: () {},
                  child: const Text('x\u00B2',
                      style: Palette.singleOperandButton)),
              TextButton(onPressed: () {}, child: const Text('x^y')),
              TextButton(onPressed: () {}, child: const Text('sin')),
              TextButton(onPressed: () {}, child: const Text('cos')),
              TextButton(onPressed: () {}, child: const Text('tan')),
              TextButton(onPressed: () {}, child: const Text('root')),
              TextButton(onPressed: () {}, child: const Text('10^x')),
              TextButton(onPressed: () {}, child: const Text('log')),
              TextButton(onPressed: () {}, child: const Text('exp')),
              TextButton(onPressed: () {}, child: const Text('mod')),
              TextButton(onPressed: () {}, child: const Text('up')),
              TextButton(onPressed: () {}, child: const Text('CE')),
              TextButton(onPressed: () {}, child: const Text('C')),
              TextButton(onPressed: () {}, child: const Text('back')),
              TextButton(onPressed: () {}, child: const Text('/')),
              TextButton(onPressed: () {}, child: const Text('pi')),
              TextButton(onPressed: () {}, child: const Text('7')),
              TextButton(onPressed: () {}, child: const Text('8')),
              TextButton(onPressed: () {}, child: const Text('9')),
              TextButton(onPressed: () {}, child: const Text('*')),
              TextButton(onPressed: () {}, child: const Text('n!')),
              TextButton(onPressed: () {}, child: const Text('4')),
              TextButton(onPressed: () {}, child: const Text('5')),
              TextButton(onPressed: () {}, child: const Text('6')),
              TextButton(onPressed: () {}, child: const Text('-')),
              TextButton(onPressed: () {}, child: const Text('+-')),
              TextButton(onPressed: () {}, child: const Text('1')),
              TextButton(onPressed: () {}, child: const Text('2')),
              TextButton(onPressed: () {}, child: const Text('3')),
              TextButton(onPressed: () {}, child: const Text('+')),
              TextButton(onPressed: () {}, child: const Text('(')),
              TextButton(onPressed: () {}, child: const Text(')')),
              TextButton(onPressed: () {}, child: const Text('0')),
              TextButton(onPressed: () {}, child: const Text('.')),
              TextButton(onPressed: () {}, child: const Text('=')),
            ],
          ),
        ],
      ),
    );
  }
}
