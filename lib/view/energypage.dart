import 'package:calculator/model/model.dart';
import 'package:calculator/view/view.dart';
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
    _from = weightData![1];
    _to = weightData![1];
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBarTitle: 'Energy',
      initialaData: weightData,
      from: _from,
      to: _to,
      initialValue: 0.0,
      model: _model,
    );
  }
}
