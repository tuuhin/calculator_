import 'package:calculator/model/basemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PressureModel extends BaseModel {
  static final SharedPreferences? preferences = BaseModel.preferences;

  getPressuresData() {
    return preferences!.getStringList('pressure');
  }
}
