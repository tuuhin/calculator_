import 'package:calculator/keyboards/keyboard.dart';
import 'package:calculator/widget/appdrawer.dart';
import 'package:flutter/material.dart';

class ScientificCalculator extends StatelessWidget {
  const ScientificCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scientic')),
      drawer: AppDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text('hellow world'), ScientificBoard()],
      ),
    );
  }
}
