import 'package:calculator/model/model.dart';
import 'package:calculator/view/view.dart';
import 'package:flutter/material.dart';

class PowerPage extends StatefulWidget {
  const PowerPage({Key? key}) : super(key: key);

  @override
  _PowerPageState createState() => _PowerPageState();
}

class _PowerPageState extends State<PowerPage> {
  late PowerModel _model;
  late List<String>? powerData;
  late String _from;
  late String _to;
  double initialValue = 0.0;

  @override
  void initState() {
    super.initState();
    _model = PowerModel();
    powerData = _model.getPowerData();
    _from = powerData![1];
    _to = powerData![2];
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBarTitle: 'Power',
      initialValue: 0.0,
      model: _model,
      initialaData: powerData,
      from: _from,
      to: _to,
      siUnit: _from,
      siUnitsuffix: 'Kw',
      commonUnitsuffix: 'Hp',
      commonUnit: _to,
      defination:
          'Power is defined as the rate of doing work,expressible as the amount of work done W or the energy transfered in the given time interval',
      formulas: const ['1 H.p. = 745.7Watt', ' 1 British Thermal Unit = .01Kw'],
    );
  }
}
