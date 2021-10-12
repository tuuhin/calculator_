import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StdCalcBoard extends StatefulWidget {
  const StdCalcBoard({Key? key}) : super(key: key);
  @override
  State<StdCalcBoard> createState() => _StdCalcBoardState();
}

class _StdCalcBoardState extends State<StdCalcBoard> {
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
                onPressed: () {}, child: const Text('CE', style: _buttonStyle)),
            TextButton(
                onPressed: () {}, child: const Text('C', style: _buttonStyle)),
            TextButton(
                onPressed: () {},
                child: const Text('\u2190', style: _buttonStyle)),
            TextButton(
                onPressed: () {},
                child: const Text('\u00f7', style: _buttonStyle)),
            TextButton(
                onPressed: () {},
                child: const Text('7', style: _buttonNumberStyle)),
            TextButton(
                onPressed: () {},
                child: const Text('8', style: _buttonNumberStyle)),
            TextButton(
                onPressed: () {},
                child: const Text('9', style: _buttonNumberStyle)),
            TextButton(
                onPressed: () {}, child: const Text('x', style: _buttonStyle)),
            TextButton(
                onPressed: () {},
                child: const Text('4', style: _buttonNumberStyle)),
            TextButton(
                onPressed: () {},
                child: const Text('5', style: _buttonNumberStyle)),
            TextButton(
                onPressed: () {},
                child: const Text('6', style: _buttonNumberStyle)),
            TextButton(
                onPressed: () {}, child: const Text('-', style: _buttonStyle)),
            TextButton(
                onPressed: () {},
                child: const Text('1', style: _buttonNumberStyle)),
            TextButton(
                onPressed: () {},
                child: const Text('2', style: _buttonNumberStyle)),
            TextButton(
                onPressed: () {},
                child: const Text('3', style: _buttonNumberStyle)),
            TextButton(
                onPressed: () {}, child: const Text('+', style: _buttonStyle)),
            TextButton(onPressed: () {}, child: const SizedBox.shrink()),
            TextButton(
                onPressed: () {},
                child: const Text('0', style: _buttonNumberStyle)),
            TextButton(
                onPressed: () {}, child: const Text('.', style: _buttonStyle)),
            TextButton(
                onPressed: () {}, child: const Text('=', style: _buttonStyle)),
          ],
        ),
      ),
    );
  }
}
