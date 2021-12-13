import 'package:calculator/services/calculate_excange_rates.dart';
import 'package:calculator/ui/keyboards/keyboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrencyPageView extends StatefulWidget {
  final Map<String, dynamic>? exchangeRates;

  const CurrencyPageView({Key? key, required this.exchangeRates})
      : super(key: key);

  @override
  _CurrencyPageViewState createState() => _CurrencyPageViewState();
}

class _CurrencyPageViewState extends State<CurrencyPageView> {
  late Rates _rates;
  late List<String> _codes;
  late String _fromRate;
  late String _toRate;
  late num _fromValue;
  late num _toValue;
  @override
  void initState() {
    super.initState();
    _codes = widget.exchangeRates!.keys.toList();
    _rates = Rates(rates: widget.exchangeRates);
    _fromRate = _codes[0];
    _toRate = _codes[0];
    _fromValue = 0;
    _toValue = 0;
  }

  @override
  Widget build(BuildContext context) {
    _toValue = _rates.getRates(_fromRate, _toRate, _fromValue) ?? 0.0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Exchange Rates',
                  style: Theme.of(context).textTheme.caption),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$_fromValue',
                      style: Theme.of(context).textTheme.headline3),
                  Text('$_fromRate -> $_toRate',
                      style: Theme.of(context).textTheme.caption),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                    width: 0.1, color: Colors.grey, style: BorderStyle.solid)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DropdownButton(
                    underline: const SizedBox(),
                    value: _fromRate,
                    onChanged: (String? value) {
                      setState(() {
                        _fromRate = value ?? _fromRate;
                      });
                    },
                    items: _codes
                        .map<DropdownMenuItem<String>>(
                            (String v) => DropdownMenuItem(
                                  value: v,
                                  child: Text(v, style: GoogleFonts.tajawal()),
                                ))
                        .toList()),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('$_toValue',
                        style: Theme.of(context).textTheme.headline5),
                    DropdownButton(
                        icon: const Icon(Icons.arrow_right),
                        underline: const SizedBox(),
                        value: _toRate,
                        onChanged: (String? value) {
                          setState(() {
                            _toRate = value ?? _toRate;
                          });
                        },
                        items: _codes
                            .map<DropdownMenuItem<String>>(
                                (String v) => DropdownMenuItem(
                                      value: v,
                                      child: Text(v),
                                    ))
                            .toList()),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        NumberBoard(
          getData: (String value) {
            setState(() {
              _fromValue = num.parse(value);
            });
            print(value);
          },
        ),
      ],
    );
  }
}
