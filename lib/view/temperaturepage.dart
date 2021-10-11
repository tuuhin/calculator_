import 'package:calculator/keyboards/keyboard.dart';
import 'package:calculator/model/model.dart';
import 'package:calculator/widget/widget.dart';
import 'package:flutter/material.dart';

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({Key? key}) : super(key: key);

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  late TemperatureModel _model;
  late List<String>? temperatureData;
  late String _from;
  late String _to;

  @override
  void initState() {
    super.initState();
    _model = TemperatureModel();
    temperatureData = _model.getTemperarureData();
    _from = temperatureData![0];
    _to = temperatureData![1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Temperature')),
      drawer: AppDrawer(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  DropdownButton(
                    menuMaxHeight: MediaQuery.of(context).size.width * 0.7,
                    value: _from,
                    items: temperatureData!
                        .map<DropdownMenuItem<String>>(
                            (String v) => DropdownMenuItem(
                                  value: v,
                                  alignment: Alignment.center,
                                  child: Text(v),
                                ))
                        .toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _from = value ?? _from;
                      });
                    },
                  ),
                  Text(
                    '${_model.prevData}',
                    style: Palette.largetext,
                  ),
                  const SizedBox(height: 40),
                  DropdownButton(
                    menuMaxHeight: MediaQuery.of(context).size.width * 0.7,
                    value: _to,
                    items: temperatureData!
                        .map<DropdownMenuItem<String>>(
                            (String v) => DropdownMenuItem(
                                  value: v,
                                  alignment: Alignment.center,
                                  child: Text(v),
                                ))
                        .toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _to = value ?? _to;
                      });
                    },
                  ),
                  Text(
                    _model.convert(_from, _to).toStringAsFixed(2),
                    style: Palette.largetext,
                  )
                ],
              ),
            ),
            NumberBoard(
              getData: (String data) {
                setState(() {
                  _model.newData = double.parse(data);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
