import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:google_fonts/google_fonts.dart';

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

  String keyvalue = '';

  @override
  Widget build(BuildContext context) {
    TextStyle? _buttonNumber = Theme.of(context).textTheme.headline4;
    TextStyle? _elevatedButtonStyle = TextStyle(
        fontSize: Theme.of(context).textTheme.headline5!.fontSize,
        color: Colors.white);

    return Row(
      children: [
        SizedBox(
          // color: Colors.red,
          width: MediaQuery.of(context).size.width * 0.7,
          // height: MediaQuery.of(context).size.height * 0.4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: [
                TextButton(
                    onPressed: () {
                      keyvalue += '1';
                      widget.getData!.call(keyvalue);
                    },
                    child: Text('1', style: _buttonNumber)),
                TextButton(
                    onPressed: () {
                      keyvalue += '2';
                      widget.getData!.call(keyvalue);
                    },
                    child: Text(
                      '2',
                      style: _buttonNumber,
                    )),
                TextButton(
                    onPressed: () {
                      keyvalue += '3';
                      widget.getData!.call(keyvalue);
                    },
                    child: Text(
                      '3',
                      style: _buttonNumber,
                    )),
                TextButton(
                    onPressed: () {
                      keyvalue += '4';
                      widget.getData!.call(keyvalue);
                    },
                    child: Text(
                      '4',
                      style: _buttonNumber,
                    )),
                TextButton(
                    onPressed: () {
                      keyvalue += '5';
                      widget.getData!.call(keyvalue);
                    },
                    child: Text(
                      '5',
                      style: _buttonNumber,
                    )),
                TextButton(
                    onPressed: () {
                      keyvalue += '6';
                      widget.getData!.call(keyvalue);
                    },
                    child: Text(
                      '6',
                      style: _buttonNumber,
                    )),
                TextButton(
                    onPressed: () {
                      keyvalue += '7';
                      widget.getData!.call(keyvalue);
                    },
                    child: Text(
                      '7',
                      style: _buttonNumber,
                    )),
                TextButton(
                    onPressed: () {
                      keyvalue += '8';
                      widget.getData!.call(keyvalue);
                    },
                    child: Text(
                      '8',
                      style: _buttonNumber,
                    )),
                TextButton(
                    onPressed: () {
                      keyvalue += '9';
                      widget.getData!.call(keyvalue);
                    },
                    child: Text(
                      '9',
                      style: _buttonNumber,
                    )),
                TextButton(
                    onPressed: () {
                      if (widget.plusMinus != null &&
                          widget.plusMinus == true &&
                          keyvalue.isNotEmpty &&
                          keyvalue != '0') {
                        keyvalue = getnegative(keyvalue).toString();
                        widget.getData!.call(keyvalue);
                      }
                    },
                    child: Text(
                      (widget.plusMinus != null && widget.plusMinus == true)
                          ? '\u00b1'
                          : '',
                      style: _buttonNumber,
                    )),
                TextButton(
                    onPressed: () {
                      keyvalue += '0';
                      widget.getData!.call(keyvalue);
                    },
                    child: Text(
                      '0',
                      style: _buttonNumber,
                    )),
                TextButton(
                    onPressed: () {
                      if (!keyvalue.contains('.')) {
                        keyvalue += '.';
                        widget.getData!.call(keyvalue);
                      }
                    },
                    child: Text(
                      '.',
                      style: _buttonNumber,
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
                    child: Text('C', style: _elevatedButtonStyle),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                            50, MediaQuery.of(context).size.height * 0.17)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (keyvalue.length > 1) {
                        keyvalue = keyvalue.substring(0, keyvalue.length - 1);
                        widget.getData!.call(keyvalue);
                      }
                    },
                    child: Text('X', style: _elevatedButtonStyle),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                            50, MediaQuery.of(context).size.height * 0.17)),
                  ),
                ]),
          ),
        )
      ],
    );
  }
}
