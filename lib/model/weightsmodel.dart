import 'package:calculator/model/basemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeightsModel extends BaseModel {
  static final SharedPreferences? preferences = BaseModel.preferences;

  getWeightsData() {
    return preferences!.getStringList('weights');
  }
}
