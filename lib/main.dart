import 'package:calculator/model/model.dart';
import 'package:calculator/view/standardcalculator.dart';
import 'package:calculator/widget/pallette.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BaseModel.init();
  if (BaseModel.getKeys()) {
    await BaseModel.setdata();
  }
  if (CurrencyModel.keycheck() == null) {
    await CurrencyModel().fetchData();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Converter',
        debugShowCheckedModeBanner: false,
        darkTheme: Palette.darkTheme,
        theme: Palette.lightTheme,
        home: const StandardCalculator());
  }
}
