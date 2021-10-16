import 'package:calculator/model/basemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PowerModel extends BaseModel {
  static final SharedPreferences? preferences = BaseModel.preferences;

  getPowerData() {
    return preferences!.getStringList('power');
  }
}
