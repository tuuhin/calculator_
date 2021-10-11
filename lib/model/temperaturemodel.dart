import 'package:calculator/model/basemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TemperatureModel extends BaseModel {
  static final SharedPreferences? preferences = BaseModel.preferences;

  double _prevData = 0.0;

  double get prevData {
    return _prevData;
  }

  set newData(double newdata) {
    _prevData = newdata;
  }

  double _convertC2F(double value) {
    return 9 / 5 * value + 32;
  }

  double _convertF2C(double value) {
    return 5 / 9 * (value - 32);
  }

  double _convertC2K(double value) {
    return value + 273.15;
  }

  double _convertK2C(double value) {
    return value - 273.15;
  }

  double _setnewTemp(String from, String to) {
    double _return = 0.0;
    if (from == to) {
      _return = _prevData;
    } else if (from == 'Celcius' && to == 'Farenheit') {
      _return = _convertC2F(_prevData);
    } else if (from == 'Celcius' && to == 'Kelvin') {
      _return = _convertC2K(_prevData);
    } else if (from == 'Farenheit' && to == 'Celcius') {
      _return = _convertF2C(_prevData);
    } else if (from == 'Farenheit' && to == 'Kelvin') {
      _return = _convertC2K(_convertF2C(_prevData));
    } else if (from == 'Kelvin' && to == 'Celcius') {
      _return = _convertK2C(_prevData);
    } else if (from == 'Kelvin' && to == 'Farenheit') {
      _return = _convertC2F(_convertK2C(_prevData));
    }
    return _return;
  }

  @override
  double convert(String from, String to) {
    return _setnewTemp(from, to);
  }

  getTemperarureData() {
    return preferences!.getStringList('temperature');
  }
}
