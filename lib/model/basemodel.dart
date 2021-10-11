import 'package:shared_preferences/shared_preferences.dart';

class BaseModel {
  static SharedPreferences? preferences;

  static Future init() async {
    preferences = await SharedPreferences.getInstance();
    //instanciate the values
  }

  static bool getKeys() {
    return preferences!.getKeys().isEmpty;
  }

  double convert(String from, String to) {
    double value = 0.0;
    double? _from = preferences!.getDouble(from);
    double? _to = preferences!.getDouble(to);
    if (_from != null && _to != null) {
      value = double.parse((_to / _from).toStringAsFixed(4));
    }
    return value;
  }

  static Future<void> setdata() async {
    final Map<String, double> _volume = {
      'MilliLiters': 1000.00,
      'CubiCentimeters': 1000.00,
      'Liters': 1.00,
      'Quarts(US)': 1.05669,
      'Gallons(US)': 0.264172,
      'Cubicinches': 61.0237,
      'Cubicfeet': 0.0353147,
      'Cubicyards': 0.00130795,
      'Quarts(UK)': 0.879877,
      'Gallons(UK)': 0.2199,
    };
    final Map<String, double> _length = {
      'MiliMeters': 1000.00,
      'Centimeters': 100.00,
      'Meters': 1.00,
      'KiloMeters': 0.001,
      'Inches': 39.37,
      'Feet': 3.2808,
      'Yards': 1.093613,
      'Miles': 0.000621371,
      'Nautical Miles': 0.000539957
    };
    final Map<String, double> _weights = {
      'Carat': 5000.00,
      'Gram': 1000.00,
      'KiloGram': 1.00,
      'MetricTones': 0.001,
      'Ounces': 35.27,
      'Pound': 2.204,
    };
    final Map<String, double> _energy = {
      'Joules': 1000,
      'KiloJoules': 1.00,
      'ThermalCalories': 239.00,
      'FoodCalories': 0.23,
      'BritishThermalUnits': .94,
    };

    _length.forEach((key, value) async {
      await preferences!.setDouble(key, value);
    });
    _volume.forEach((key, value) async {
      await preferences!.setDouble(key, value);
    });
    _weights.forEach((key, value) async {
      await preferences!.setDouble(key, value);
    });
    _energy.forEach((key, value) async {
      await preferences!.setDouble(key, value);
    });
    await preferences!.setStringList('length', _length.keys.toList());
    await preferences!.setStringList('weights', _weights.keys.toList());
    await preferences!.setStringList('volume', _volume.keys.toList());
    await preferences!.setStringList('energy', _energy.keys.toList());
    await preferences!
        .setStringList('temperature', ['Celcius', 'Farenheit', 'Kelvin']);
  }
}
