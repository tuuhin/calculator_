import 'package:calculator/model/basemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnergyModel extends BaseModel {
  static final SharedPreferences? preferences = BaseModel.preferences;

  getEnergyData() {
    return preferences!.getStringList('energy');
  }
}
