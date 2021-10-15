import 'package:calculator/keyboards/keyboard.dart';
import 'package:calculator/model/model.dart';
import 'package:calculator/widget/widget.dart';
import 'package:flutter/material.dart';

class BaseView extends StatefulWidget {
  final BaseModel? model;
  num initialValue;
  String from;
  String to;
  final String appBarTitle;
  final List<String>? initialaData;
  final String siUnit;
  final String commonUnit;
  final String siUnitsuffix;
  final String commonUnitsuffix;
  final List<String>? formulas;
  final String? defination;

  // double Function (String, String) convert;
  BaseView({
    Key? key,
    this.model,
    this.initialaData,
    required this.siUnit,
    required this.commonUnit,
    required this.appBarTitle,
    required this.initialValue,
    required this.from,
    required this.to,
    required this.siUnitsuffix,
    required this.commonUnitsuffix,
    this.formulas,
    this.defination,
  }) : super(key: key);

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
      ),
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
                    value: widget.from,
                    items: widget.initialaData!
                        .map<DropdownMenuItem<String>>(
                            (String v) => DropdownMenuItem(
                                  value: v,
                                  alignment: Alignment.center,
                                  child: Text(v),
                                ))
                        .toList(),
                    onChanged: (String? value) {
                      setState(() {
                        widget.from = value ?? widget.from;
                      });
                    },
                  ),
                  Text(
                    '${widget.initialValue}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(height: 30),
                  DropdownButton(
                    menuMaxHeight: MediaQuery.of(context).size.width * 0.7,
                    value: widget.to,
                    items: widget.initialaData!
                        .map<DropdownMenuItem<String>>(
                            (String v) => DropdownMenuItem(
                                  value: v,
                                  alignment: Alignment.center,
                                  child: Text(v),
                                ))
                        .toList(),
                    onChanged: (String? value) {
                      setState(() {
                        widget.to = value ?? widget.to;
                      });
                    },
                  ),
                  Text(
                    (widget.initialValue *
                            widget.model!.convert(widget.from, widget.to))
                        .toStringAsPrecision(4),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Column(
                    children: [
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const SizedBox(height: 2),
                          Text.rich(TextSpan(
                              text: 'Defination: ',
                              style: Theme.of(context).textTheme.bodyText1,
                              children: [
                                TextSpan(
                                    text: widget.defination ?? '',
                                    style: Theme.of(context).textTheme.caption)
                              ])),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Important conversions: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: widget.formulas!
                                              .map((e) => Text(e,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2))
                                              .toList()),
                                    )
                                  ]),
                              Container(
                                padding: const EdgeInsets.all(1),
                                child: InfoContainer(
                                  model: widget.model,
                                  data: widget.initialValue,
                                  siUnit: widget.siUnit,
                                  commonUnit: widget.commonUnit,
                                  currentUnit: widget.from,
                                  siUnitsuffix: widget.siUnitsuffix,
                                  commonUnitsuffix: widget.commonUnitsuffix,
                                ),
                                // height: 100,
                                // color: Colors.purple,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [
                const Divider(),
                NumberBoard(
                  getData: (String data) {
                    setState(() {
                      widget.initialValue = num.parse(data);
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
