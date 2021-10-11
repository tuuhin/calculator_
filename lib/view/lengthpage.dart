import 'package:calculator/model/model.dart';
import 'package:calculator/view/view.dart';
import 'package:flutter/material.dart';

class LengthPage extends StatefulWidget {
  const LengthPage({Key? key}) : super(key: key);

  @override
  _LengthPageState createState() => _LengthPageState();
}

class _LengthPageState extends State<LengthPage> {
  late LengthDataModel _model;
  late List<String>? lengthData;
  late String _from;
  late String _to;
  double initialValue = 0.0;

  @override
  void initState() {
    super.initState();
    _model = LengthDataModel();
    lengthData = _model.getLengthData();
    _from = lengthData![0];
    _to = lengthData![0];
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBarTitle: 'Length',
      initialaData: lengthData,
      from: _from,
      to: _to,
      initialValue: 0.0,
      model: _model,
    );
  }
}
