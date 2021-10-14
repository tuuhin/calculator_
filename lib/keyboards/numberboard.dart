import 'package:calculator/widget/widget.dart';
import 'package:calculator/widget/widgetdecorator.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
import 'package:math_expressions/math_expressions.dart';

class NumberBoard extends StatefulWidget {
  final ValueChanged<String>? getData;
  final bool? plusMinus;
  const NumberBoard({Key? key, this.getData, this.plusMinus}) : super(key: key);

  @override
  State<NumberBoard> createState() => _NumberBoardState();
}

class _NumberBoardState extends State<NumberBoard> {
  num getnegative(String eval) {
    Expression _exp = Parser().parse(eval + '*-1');
    return _exp.evaluate(EvaluationType.REAL, ContextModel());
  }

  static const _numberButtonStyle =
      TextStyle(fontWeight: FontWeight.w700, fontSize: 30);
  String keyvalue = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          // color: Colors.red,
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.38,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 18,
              runSpacing: 18,
              children: [
                TextButton(
                    onPressed: () {
                      keyvalue += '1';
                      widget.getData!.call(keyvalue);
                    },
                    child: const Text(
                      '1',
                      style: _numberButtonStyle,
                    )),
                TextButton(
                    onPressed: () {
                      keyvalue += '2';
                      widget.getData!.call(keyvalue);
                    },
                    child: const Text(
                      '2',
                      style: Palette.largetext,
                    )),
                TextButton(
                    onPressed: () {
                      keyvalue += '3';
                      widget.getData!.call(keyvalue);
                    },
                    child: const Text(
                      '3',
                      style: Palette.largetext,
                    )),
                TextButton(
                    onPressed: () {
                      keyvalue += '4';
                      widget.getData!.call(keyvalue);
                    },
                    child: const Text(
                      '4',
                      style: Palette.largetext,
                    )),
                TextButton(
                    onPressed: () {
                      keyvalue += '5';
                      widget.getData!.call(keyvalue);
                    },
                    child: const Text(
                      '5',
                      style: Palette.largetext,
                    )),
                TextButton(
                    onPressed: () {
                      keyvalue += '6';
                      widget.getData!.call(keyvalue);
                    },
                    child: const Text(
                      '6',
                      style: Palette.largetext,
                    )),
                TextButton(
                    onPressed: () {
                      keyvalue += '7';
                      widget.getData!.call(keyvalue);
                    },
                    child: const Text(
                      '7',
                      style: Palette.largetext,
                    )),
                TextButton(
                    onPressed: () {
                      keyvalue += '8';
                      widget.getData!.call(keyvalue);
                    },
                    child: const Text(
                      '8',
                      style: Palette.largetext,
                    )),
                TextButton(
                    onPressed: () {
                      keyvalue += '9';
                      widget.getData!.call(keyvalue);
                    },
                    child: const Text(
                      '9',
                      style: Palette.largetext,
                    )),
                TextButton(
                    onPressed: () {
                      if (widget.plusMinus != null &&
                          widget.plusMinus == true &&
                          keyvalue != '0') {
                        print(getnegative(keyvalue));
                        keyvalue = getnegative(keyvalue).toString();
                        widget.getData!.call(keyvalue);
                      }
                    },
                    child: Text(
                      (widget.plusMinus != null && widget.plusMinus == true)
                          ? '+-'
                          : '',
                      style: Palette.largetext,
                    )),
                TextButton(
                    onPressed: () {
                      keyvalue += '0';
                      widget.getData!.call(keyvalue);
                    },
                    child: const Text(
                      '0',
                      style: Palette.largetext,
                    )),
                TextButton(
                    onPressed: () {
                      if (!keyvalue.contains('.')) {
                        keyvalue += '.';
                        widget.getData!.call(keyvalue);
                      }
                    },
                    child: const Text(
                      '.',
                      style: Palette.largetext,
                    )),
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.38,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      keyvalue = '0';
                      widget.getData!.call(keyvalue);
                    },
                    child: const Text('CE'),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                      50,
                      MediaQuery.of(context).size.height * 0.17,
                    )),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (keyvalue.length > 1) {
                        keyvalue = keyvalue.substring(0, keyvalue.length - 1);
                        widget.getData!.call(keyvalue);
                      }
                    },
                    child: const Text('X'),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                      50,
                      MediaQuery.of(context).size.height * 0.17,
                    )),
                  ),
                ]),
          ),
        )
      ],
    );
  }
}
