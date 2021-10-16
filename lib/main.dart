import 'package:calculator/model/model.dart';
import 'package:calculator/settings/themeprovider.dart';
import 'package:calculator/view/standardcalculator.dart';
import 'package:calculator/widget/pallette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (BuildContext context, _) {
        return MaterialApp(
            title: 'Calculator',
            debugShowCheckedModeBanner: false,
            themeMode: Provider.of<ThemeProvider>(context).themeMode,
            darkTheme: Palette.darkTheme,
            theme: Palette.lightTheme,
            home: const StandardCalculator());
      },
    );
  }
}
