import 'package:calculator/model/basemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpeedModel extends BaseModel {
  static final SharedPreferences? preferences = BaseModel.preferences;

  getSpeedsData() {
    return preferences!.getStringList('speeds');
  }
}
