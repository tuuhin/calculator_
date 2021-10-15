import 'package:calculator/model/model.dart';
import 'package:calculator/view/view.dart';
import 'package:calculator/widget/widget.dart';
import 'package:flutter/material.dart';

class EnergyPage extends StatefulWidget {
  const EnergyPage({Key? key}) : super(key: key);

  @override
  State<EnergyPage> createState() => _EnergyPageState();
}

class _EnergyPageState extends State<EnergyPage> {
  late EnergyModel _model;
  late List<String>? weightData;
  late String _from;
  late String _to;
  double initialValue = 0.0;

  @override
  void initState() {
    super.initState();
    _model = EnergyModel();
    weightData = _model.getEnergyData();
    _from = weightData![0];
    _to = weightData![2];
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBarTitle: 'Energy',
      initialValue: 0.0,
      model: _model,
      initialaData: weightData,
      from: _from,
      to: _to,
      siUnit: _from,
      siUnitsuffix: 'J',
      commonUnitsuffix: 'cal',
      commonUnit: _to,
      defination: 'Energy is the rate of doing work...',
      formulas: const ['1  J = 0.001 KJ', ' 1J = 4.18 cal'],
    );
  }
}
