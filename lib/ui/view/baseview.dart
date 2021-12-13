import 'package:calculator/services/calculate_excange_rates.dart';
import 'package:calculator/services/inbuilt_convertor_service.dart';
import 'package:calculator/ui/keyboards/keyboard.dart';
import 'package:flutter/material.dart';

class BaseView extends StatefulWidget {
  final Map<String, dynamic>? data;
  final String title;
  const BaseView({
    Key? key,
    this.data,
    required this.title,
  }) : super(key: key);

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  late Rates _rates;
  late List<String> _units;
  late String _fromUnit;
  late String _toUnit;
  late num _fromValue;
  late num _toValue;
  @override
  void initState() {
    super.initState();
    _rates = Rates(rates: widget.data);
    _units = widget.data!.keys.toList();
    _fromUnit = _units[0];
    _toUnit = _units[0];
    _fromValue = 0;
    _toValue = 0;
  }

  @override
  Widget build(BuildContext context) {
    _toValue = _rates.getRates(_fromUnit, _toUnit, _fromValue) ?? 0.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                print(InBuiltConvertor.getLengthData());
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Exchange Rates',
                    style: Theme.of(context).textTheme.caption),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('$_fromValue',
                        style: Theme.of(context).textTheme.headline3),
                    Text('$_fromUnit -> $_toUnit',
                        style: Theme.of(context).textTheme.caption),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                      width: 0.1,
                      color: Colors.grey,
                      style: BorderStyle.solid)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DropdownButton(
                      underline: const SizedBox(),
                      value: _fromUnit,
                      onChanged: (String? value) {
                        setState(() {
                          _fromUnit = value ?? _fromUnit;
                        });
                      },
                      items: _units
                          .map<DropdownMenuItem<String>>(
                              (String v) => DropdownMenuItem(
                                    value: v,
                                    child: Text(v),
                                  ))
                          .toList()),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('$_toValue',
                          style: Theme.of(context).textTheme.headline5),
                      DropdownButton(
                          icon: const Icon(Icons.arrow_right),
                          underline: const SizedBox(),
                          value: _toUnit,
                          onChanged: (String? value) {
                            setState(() {
                              _toUnit = value ?? _toUnit;
                            });
                          },
                          items: _units
                              .map<DropdownMenuItem<String>>(
                                  (String v) => DropdownMenuItem(
                                        value: v,
                                        child: Text(v),
                                      ))
                              .toList()),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          NumberBoard(
            getData: (String value) {
              setState(() {
                _fromValue = num.parse(value);
              });
              print(value);
            },
          ),
        ],
      ),
    );
  }
}
