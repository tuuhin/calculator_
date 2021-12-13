import 'package:calculator/data/local/currency_hive_database.dart';
import 'package:flutter/cupertino.dart';

class CurrencyData with ChangeNotifier {
  bool _success = CurrencyHiveDatabase.checkEntryExists();
  bool get success => _success;

  void checkEntryExists() {
    bool _exists = CurrencyHiveDatabase.checkEntryExists();
    print(_exists);
    _success = _exists;
    notifyListeners();
  }
}
