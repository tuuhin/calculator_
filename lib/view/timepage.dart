import 'package:calculator/model/model.dart';
import 'package:calculator/view/view.dart';
import 'package:flutter/material.dart';

class TimePage extends StatefulWidget {
  const TimePage({Key? key}) : super(key: key);

  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  late TimeModel _model;
  late List<String>? timeData;
  late String _from;
  late String _to;
  double initialValue = 0.0;

  @override
  void initState() {
    super.initState();
    _model = TimeModel();
    timeData = _model.getTimeData();
    _from = timeData![0];
    _to = timeData![2];
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBarTitle: 'Time',
      initialValue: 0.0,
      model: _model,
      initialaData: timeData,
      from: _from,
      to: _to,
      siUnit: _from,
      siUnitsuffix: 'sec',
      commonUnitsuffix: 'Hr',
      commonUnit: _to,
      defination:
          'The progression of events from past to future.in physics time is define as the fourth dimension of reality',
      formulas: const ['1 year = 365.3 days', ' 1day = 24 hrs'],
    );
  }
}
