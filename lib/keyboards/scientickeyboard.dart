import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScienticBoard extends StatelessWidget {
  const ScienticBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _buttonStyle = TextStyle(
        fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold);
    const _buttonNumberStyle =
        TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * .6,
      // color: Colors.blue,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Wrap(
          runSpacing: 10,
          spacing: 10,
          children: [
            TextButton(
                onPressed: () {},
                child: const Text('x\u00B2', style: _buttonStyle)),
            TextButton(
                onPressed: () {},
                child: const Text('\u221A', style: _buttonStyle)),
            TextButton(
                onPressed: () {},
                child: const Text('\u00B1', style: _buttonStyle)),
            TextButton(
                onPressed: () {},
                child: const Text('\u00b9\u2044\u2093', style: _buttonStyle)),
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
