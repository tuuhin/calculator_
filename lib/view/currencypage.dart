import 'package:calculator/keyboards/keyboard.dart';
import 'package:calculator/model/currencymodel.dart';
import 'package:calculator/widget/fetchwidget.dart';
import 'package:calculator/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({Key? key}) : super(key: key);

  @override
  State<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  late CurrencyModel _model;
  late List<String>? countrycode;
  late String fromCode;
  late String toCode1;
  late String toCode2;
  late double value1;
  late double value2;
  double input = 0.0;

  @override
  void initState() {
    super.initState();
    _model = CurrencyModel();
    countrycode = _model.getAllCountryName();
    print(countrycode);
    if (countrycode != null) {
      fromCode = countrycode![0];
      toCode1 = countrycode![0];
      toCode2 = countrycode![0];
      value1 = _model.convert(fromCode, toCode1);
      value2 = _model.convert(fromCode, toCode1);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency'),
      ),
      drawer: AppDrawer(),
      body: countrycode != null
          ? Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DropdownButton(
                            value: fromCode,
                            menuMaxHeight: 200,
                            items: countrycode!
                                .map<DropdownMenuItem<String>>(
                                    (String v) => DropdownMenuItem(
                                          value: v,
                                          alignment: Alignment.center,
                                          child: Text(v),
                                        ))
                                .toList(),
                            onChanged: (String? v) {
                              setState(() {
                                if (v != null) {
                                  fromCode = v;
                                  value1 = _model.convert(fromCode, toCode1);
                                  value2 = _model.convert(fromCode, toCode2);
                                }
                              });
                            },
                          ),
                          Text('$input', style: Palette.largetext),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DropdownButton(
                            value: toCode1,
                            // isExpanded: true,
                            items: countrycode!
                                .map<DropdownMenuItem<String>>(
                                  (String v) => DropdownMenuItem(
                                    value: v,
                                    alignment: Alignment.center,
                                    child: Text(v),
                                  ),
                                )
                                .toList(),
                            onChanged: (String? v) {
                              setState(() {
                                if (v != null) {
                                  toCode1 = v;
                                  value1 = _model.convert(fromCode, toCode1);
                                }
                              });
                            },
                          ),
                          Text((input * value1).toStringAsFixed(2),
                              style: Palette.largetext),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DropdownButton(
                            value: toCode2,

                            // isExpanded: true,
                            items: countrycode!
                                .map<DropdownMenuItem<String>>(
                                  (String v) => DropdownMenuItem(
                                    value: v,
                                    alignment: Alignment.center,
                                    child: Text(v),
                                  ),
                                )
                                .toList(),
                            onChanged: (String? v) {
                              setState(() {
                                if (v != null) {
                                  toCode2 = v;
                                  value2 = _model.convert(fromCode, toCode2);
                                }
                              });
                            },
                          ),
                          Text((input * value2).toStringAsFixed(2),
                              style: Palette.largetext),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text('Exchange Rates',
                                style: TextStyle(
                                    decoration: TextDecoration.underline)),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('1 $fromCode = $value1 $toCode1'),
                                Text('1 $fromCode = $value2 $toCode2'),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                                'Last Updated At :${_model.getLastUpdateTime()}'),
                            TextButton(
                              onPressed: () async {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const UpdateDialog();
                                    });
                              },
                              child: const Text('Update Rates'),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Divider(),
                      NumberBoard(getData: (String v) {
                        print(v);
                        setState(() {
                          input = double.parse(v);
                        });
                      }),
                    ],
                  )
                ],
              ),
            )
          : const FetchWidget(),
    );
  }
}
