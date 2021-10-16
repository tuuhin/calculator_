import 'package:calculator/model/basemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimeModel extends BaseModel {
  static final SharedPreferences? preferences = BaseModel.preferences;

  getTimeData() {
    return preferences!.getStringList('time');
  }
}
