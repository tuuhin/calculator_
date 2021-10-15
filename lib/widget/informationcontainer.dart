import 'package:flutter/material.dart';
import 'package:calculator/model/model.dart';

class InfoContainer extends StatefulWidget {
  final BaseModel? model;
  final num? data;
  final String siUnit;
  final String commonUnit;
  final String? currentUnit;
  final String siUnitsuffix;
  final String commonUnitsuffix;
  const InfoContainer({
    Key? key,
    this.data,
    this.model,
    required this.siUnit,
    required this.commonUnit,
    this.currentUnit,
    required this.siUnitsuffix,
    required this.commonUnitsuffix,
  }) : super(key: key);

  @override
  _InfoContainerState createState() => _InfoContainerState();
}

class _InfoContainerState extends State<InfoContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('About equals to ',
                  style: Theme.of(context).textTheme.caption),
              Text(
                ((widget.data ?? 0) *
                        widget.model!.convert(
                            widget.currentUnit.toString(),
                            widget.currentUnit == widget.siUnit
                                ? widget.commonUnit.toString()
                                : widget.siUnit.toString()))
                    .toStringAsFixed(2),
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.headline5!.fontSize,
                    color: Theme.of(context).textTheme.headline4!.color),
              )
            ],
          )
        ],
      ),
    );
  }
}
