import 'package:calculator/model/data.dart';
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

  static Future<void> setdata() async {
    DataClass.length.forEach((key, value) async {
      await preferences!.setDouble(key, value);
    });
    DataClass.volume.forEach((key, value) async {
      await preferences!.setDouble(key, value);
    });
    DataClass.weights.forEach((key, value) async {
      await preferences!.setDouble(key, value);
    });
    DataClass.energy.forEach((key, value) async {
      await preferences!.setDouble(key, value);
    });
    DataClass.speeds.forEach((key, value) async {
      await preferences!.setDouble(key, value);
    });
    DataClass.power.forEach((key, value) async {
      await preferences!.setDouble(key, value);
    });
    DataClass.pressure.forEach((key, value) async {
      await preferences!.setDouble(key, value);
    });
    DataClass.time.forEach((key, value) async {
      await preferences!.setDouble(key, value);
    });
    await preferences!.setStringList('length', DataClass.length.keys.toList());
    await preferences!
        .setStringList('weights', DataClass.weights.keys.toList());
    await preferences!.setStringList('volume', DataClass.volume.keys.toList());
    await preferences!.setStringList('energy', DataClass.energy.keys.toList());
    await preferences!.setStringList('speeds', DataClass.speeds.keys.toList());
    await preferences!.setStringList('power', DataClass.power.keys.toList());
    await preferences!
        .setStringList('pressure', DataClass.pressure.keys.toList());
    await preferences!.setStringList('time', DataClass.time.keys.toList());
    await preferences!.setStringList('temperature', DataClass.temperature);
  }
}
