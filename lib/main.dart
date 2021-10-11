import 'package:calculator/model/model.dart';
import 'package:calculator/view/standardcalculator.dart';
import 'package:calculator/view/view.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BaseModel.init();
  if (BaseModel.getKeys()) {
    await BaseModel.setdata();
    print('set nw data');
  }
  if (CurrencyModel.keycheck() == null) {
    await CurrencyModel().fetchData();
    print('added data');
  } else {
    print('data abpsent');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(
          colorScheme: ColorScheme.highContrastDark(),
        ),
        theme: ThemeData(
          colorScheme: ColorScheme.highContrastLight(),
        ),
        home: const StandardCalculator());
  }
}
