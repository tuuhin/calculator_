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
    _to = weightData![2];
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBarTitle: 'Weights and Masses',
      initialaData: weightData,
      from: _from,
      to: _to,
      initialValue: 0.0,
      model: _model,
    );
  }
}
