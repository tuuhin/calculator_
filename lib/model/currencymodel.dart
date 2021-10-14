import 'dart:convert';
import 'dart:io';
import 'package:calculator/model/basemodel.dart';
import 'package:calculator/model/model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CurrencyModel extends BaseModel {
  static SharedPreferences? preferences = BaseModel.preferences;

  static keycheck() {
    return preferences!.getDouble('INR');
  }

  Future<bool> fetchData() async {
    List<String> _allCodeodes = [];
    String url =
        'https://v6.exchangerate-api.com/v6/469b97afb8394fc46f3a7672/latest/INR';
    var baseUrl = Uri.parse(url);
    try {
      http.Response _rep = await http.get(baseUrl);

      Map decodeResponse = jsonDecode(_rep.body)['conversion_rates'];
      String lastUpdateUtc = jsonDecode(_rep.body)['time_last_update_utc'];
      decodeResponse.forEach((key, value) async {
        _allCodeodes.add(key);
        await _setData(key, value);
      });
      await preferences!.setStringList('country-code', _allCodeodes);
      await preferences!.setString('update-at-utc', lastUpdateUtc);
      return true;
    } on SocketException {
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> _setData(String name, num value) async {
    try {
      await preferences!.setDouble(name, value.toDouble());
    } catch (e) {
      print(e.toString());
    }
  }

  getAllCountryName() {
    return preferences!.getStringList('country-code');
  }

  String? getLastUpdateTime() {
    return preferences!.getString('update-at-utc');
  }
}
