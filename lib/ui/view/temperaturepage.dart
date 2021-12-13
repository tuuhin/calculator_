import 'package:calculator/model/model.dart';
import 'package:calculator/ui/keyboards/keyboard.dart';
import 'package:calculator/ui/widget/widget.dart';
import 'package:flutter/material.dart';

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({Key? key}) : super(key: key);

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  late TemperatureModel _model;
  late List<String>? temperatureData;
  late String _from;
  late String _to;

  @override
  void initState() {
    super.initState();
    _model = TemperatureModel();
    temperatureData = _model.getTemperarureData();
    _from = temperatureData![0];
    _to = temperatureData![1];
  }

  final List<String> _formulas = [
    '\u00b0C = 5/9 * ( \u00b0F - 32 )',
    '\u00b0K = \u00b0C + 273.15',
    '\u00b0F = 9/5 * \u00b0F + 32'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Temperature')),
      drawer: AppDrawer(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\u00b0' + _from[0],
                          style: Theme.of(context).textTheme.headline4),
                      Column(
                        children: [
                          DropdownButton(
                            menuMaxHeight:
                                MediaQuery.of(context).size.width * 0.7,
                            value: _from,
                            items: temperatureData!
                                .map<DropdownMenuItem<String>>(
                                    (String v) => DropdownMenuItem(
                                          value: v,
                                          alignment: Alignment.center,
                                          child: Text(v),
                                        ))
                                .toList(),
                            onChanged: (String? value) {
                              setState(() {
                                _from = value ?? _from;
                              });
                            },
                          ),
                          Text(
                            '${_model.prevData}',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\u00b0' + _to[0],
                          style: Theme.of(context).textTheme.headline4),
                      Column(
                        children: [
                          DropdownButton(
                            menuMaxHeight:
                                MediaQuery.of(context).size.width * 0.7,
                            value: _to,
                            items: temperatureData!
                                .map<DropdownMenuItem<String>>(
                                    (String v) => DropdownMenuItem(
                                          value: v,
                                          alignment: Alignment.center,
                                          child: Text(v),
                                        ))
                                .toList(),
                            onChanged: (String? value) {
                              setState(() {
                                _to = value ?? _to;
                              });
                            },
                          ),
                          Text(
                            _model.convertTemp(_from, _to).toStringAsFixed(2),
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                  Container(
                      // height: 100,
                      // padding: const EdgeInsets.symmetric(vertical: 10),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(TextSpan(
                              text: 'Defination: ',
                              style: Theme.of(context).textTheme.bodyText1,
                              children: [
                                TextSpan(
                                    text:
                                        'The degree or intensity of heat present in the substance',
                                    style: Theme.of(context).textTheme.caption)
                              ])),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Formula for conversion',
                                  style: Theme.of(context).textTheme.bodyText1),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: _formulas.map((e) {
                                          return Text(e,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2);
                                        }).toList()),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text('About equal to',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption),
                                      Text(
                                        _from == 'Kelvin'
                                            ? _model
                                                    .convertTemp(
                                                        _from, 'Celcius')
                                                    .toStringAsFixed(2) +
                                                '\u00b0C'
                                            : _model
                                                    .convertTemp(
                                                        _from, 'Kelvin')
                                                    .toStringAsFixed(2) +
                                                '\u00b0K',
                                        style: TextStyle(
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .fontSize,
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline4!
                                                .color),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ))
                ],
              ),
            ),
            Column(
              children: [
                const Divider(),
                NumberBoard(
                  plusMinus: true,
                  getData: (String data) {
                    setState(() {
                      _model.newData = num.parse(data);
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
