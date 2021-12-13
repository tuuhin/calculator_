import 'package:calculator/data/api/currency_api.dart';
import 'package:hive/hive.dart';

class CurrencyHiveDatabase {
  static final CurrencyAPi _api = CurrencyAPi();
  static Box? box;

  static Future init() async {
    box = await Hive.openBox('currency');
  }

  static Future<bool?> createCurrencyBox({bool update = false}) async {
    if (!checkEntryExists() || update) {
      Map? currencyData = await _api.fetchData();
      if (currencyData != null) {
        await box!.put('currency-data', currencyData as Map<String, dynamic>);
        await box!.put('exists', true);
        print('added');
        return true;
      }
    }
    return false;
  }

  static bool checkEntryExists() {
    bool? _exists = box!.get('exists');
    return (_exists == true) ? true : false;
  }

  static clear() async {
    await box!.clear();
  }

  static Map<String, dynamic>? exchangerates() {
    Map<String, dynamic>? _rates =
        box!.get('currency-data')['conversion_rates'].cast<String, dynamic>();
    return _rates;
  }

  static Future<bool?> updateRates() async {
    // await clear();
    return await createCurrencyBox(update: true);
  }
}
