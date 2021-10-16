import 'package:calculator/model/model.dart';
import 'package:calculator/view/view.dart';
import 'package:flutter/material.dart';

class PressurePage extends StatefulWidget {
  const PressurePage({Key? key}) : super(key: key);

  @override
  _PressurePageState createState() => _PressurePageState();
}

class _PressurePageState extends State<PressurePage> {
  late PressureModel _model;
  late List<String>? pressureData;
  late String _from;
  late String _to;
  double initialValue = 0.0;

  @override
  void initState() {
    super.initState();
    _model = PressureModel();
    pressureData = _model.getPressuresData();
    _from = pressureData![2];
    _to = pressureData![1];
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBarTitle: 'Pressure',
      initialValue: 0.0,
      model: _model,
      initialaData: pressureData,
      from: _from,
      to: _to,
      siUnit: _from,
      siUnitsuffix: 'kPa',
      commonUnitsuffix: 'Atm',
      commonUnit: _to,
      defination:
          'Pressure is defined as the normal force per unit area or the stress at a point within a confined fluid ',
      formulas: const ['1 atm = 101.3Kpa', ' 1atm  = 76cm of Hg'],
    );
  }
}
