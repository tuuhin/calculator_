import 'package:calculator/data/local/currency_hive_database.dart';
import 'package:calculator/data/local/local_database.dart';
import 'package:calculator/services/currency_service.dart';
import 'package:calculator/services/inbuilt_convertor_service.dart';
import 'package:calculator/ui/theme/pallette.dart';
import 'package:calculator/ui/theme/themeprovider.dart';
import 'package:calculator/ui/view/calculator/standardcalculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Hive.initFlutter();
  await CurrencyHiveDatabase.init();
  await LocalDataBase.addData();
  await InBuiltConvertor.init();
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<CurrencyData>(create: (_) => CurrencyData())
      ],
      builder: (context, widget) => MaterialApp(
          title: 'Calculator',
          debugShowCheckedModeBanner: false,
          themeMode: Provider.of<ThemeProvider>(context).themeMode,
          darkTheme: Palette.darkTheme,
          theme: Palette.lightTheme,
          home: const StandardCalculator()),
    );
  }
}
