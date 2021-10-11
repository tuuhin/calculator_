import 'package:calculator/model/basemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VolumeModel extends BaseModel {
  static final SharedPreferences? preferences = BaseModel.preferences;

  getVolumnData() {
    return preferences!.getStringList('volume');
  }
}
