import 'package:calculator/model/model.dart';
import 'package:calculator/view/view.dart';
import 'package:flutter/material.dart';

class VolumePage extends StatefulWidget {
  const VolumePage({Key? key}) : super(key: key);

  @override
  _VolumePageState createState() => _VolumePageState();
}

class _VolumePageState extends State<VolumePage> {
  late VolumeModel _model;
  late List<String>? volumeData;
  late String _from;
  late String _to;
  double initialValue = 0.0;

  @override
  void initState() {
    super.initState();
    _model = VolumeModel();
    volumeData = _model.getVolumnData();
    _from = volumeData![0];
    _to = volumeData![0];
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBarTitle: 'Volume',
      initialaData: volumeData,
      from: _from,
      to: _to,
      initialValue: 0.0,
      model: _model,
    );
  }
}
