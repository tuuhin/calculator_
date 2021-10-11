import 'package:calculator/model/basemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LengthDataModel extends BaseModel {
  static final SharedPreferences? preferences = BaseModel.preferences;

  getLengthData() {
    return preferences!.getStringList('length');
  }
}
