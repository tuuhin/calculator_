import 'package:calculator/model/basemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TemperatureModel extends BaseModel {
  static final SharedPreferences? preferences = BaseModel.preferences;

  num _prevData = 0;

  num get prevData {
    return _prevData;
  }

  set newData(num newdata) {
    _prevData = newdata;
  }

  num _convertC2F(num value) {
    return 9 / 5 * value + 32;
  }

  num _convertF2C(num value) {
    return 5 / 9 * (value - 32);
  }

  num _convertC2K(num value) {
    return value + 273.15;
  }

  num _convertK2C(num value) {
    return value - 273.15;
  }

  num _setnewTemp(String from, String to) {
    num _return = 0.0;
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

  num convertTemp(String from, String to) {
    return _setnewTemp(from, to);
  }

  getTemperarureData() {
    return preferences!.getStringList('temperature');
  }
}
