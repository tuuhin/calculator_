import 'package:calculator/model/model.dart';
import 'package:calculator/view/view.dart';
import 'package:flutter/material.dart';

class SpeedPage extends StatefulWidget {
  const SpeedPage({Key? key}) : super(key: key);

  @override
  _SpeedPageState createState() => _SpeedPageState();
}

class _SpeedPageState extends State<SpeedPage> {
  late SpeedModel _model;
  late List<String>? speedData;
  late String _from;
  late String _to;
  double initialValue = 0.0;

  @override
  void initState() {
    super.initState();
    _model = SpeedModel();
    speedData = _model.getSpeedsData();
    _from = speedData![0];
    _to = speedData![1];
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBarTitle: 'Speed',
      initialValue: 0.0,
      model: _model,
      initialaData: speedData,
      from: _from,
      to: _to,
      siUnit: _from,
      siUnitsuffix: 'm/s',
      commonUnitsuffix: 'km/s',
      commonUnit: _to,
      defination: 'Speed is the rate of change of distance',
      formulas: const ['1 L = 1m\u00b3', ' 1L = .26 gallons(US)'],
    );
  }
}
