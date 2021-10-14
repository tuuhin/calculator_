import 'package:calculator/keyboards/keyboard.dart';
import 'package:calculator/model/model.dart';
import 'package:calculator/widget/widget.dart';
import 'package:flutter/material.dart';

class BaseView extends StatefulWidget {
  final BaseModel? model;
  double initialValue;
  String from;
  String to;
  final String appBarTitle;
  final List<String>? initialaData;
  // double Function (String, String) convert;
  BaseView(
      {Key? key,
      this.model,
      required this.appBarTitle,
      required this.initialValue,
      required this.from,
      required this.to,
      this.initialaData})
      : super(key: key);

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
                    style: Palette.largetext,
                  ),
                  const SizedBox(height: 40),
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
                        .toString(),
                    style: Palette.largetext,
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
                      widget.initialValue = double.parse(data);
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
