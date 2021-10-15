import 'package:calculator/model/weightsmodel.dart';
import 'package:calculator/view/view.dart';
import 'package:flutter/material.dart';

class WeightPage extends StatefulWidget {
  const WeightPage({Key? key}) : super(key: key);

  @override
  State<WeightPage> createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  late WeightsModel _model;
  late List<String>? weightData;
  late String _from;
  late String _to;
  double initialValue = 0.0;

  @override
  void initState() {
    super.initState();
    _model = WeightsModel();
    weightData = _model.getWeightsData();
    _from = weightData![2];
    _to = weightData![5];
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBarTitle: 'Length',
      initialValue: 0.0,
      model: _model,
      initialaData: weightData,
      from: _from,
      to: _to,
      siUnit: _from,
      siUnitsuffix: 'kg',
      commonUnitsuffix: 'pd',
      commonUnit: _to,
      defination: 'deff ..',
      formulas: const ['1  J = 0.001 KJ', ' 1J = 4.18 cal'],
    );
  }
}
