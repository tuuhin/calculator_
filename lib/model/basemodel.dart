import 'package:shared_preferences/shared_preferences.dart';

class BaseModel {
  static SharedPreferences? preferences;

  static Future init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static bool getKeys() {
    return preferences!.getKeys().isEmpty;
  }

  double convert(String from, String to) {
    double value = 0.0;
    double? _from = preferences!.getDouble(from);
    double? _to = preferences!.getDouble(to);
    if (_from != null && _to != null) {
      value = double.parse((_to / _from).toString());
    }
    return value;
  }
}
