import 'package:calculator/data/local/localdata.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalDataBase {
  static addData() async {
    bool add = await Hive.boxExists('inbuilt');
    print(' $add');
    if (!add) {
      Box? inbuilt = await Hive.openBox('inbuilt');
      await inbuilt.put('length', LocalData.length);
      await inbuilt.put('energy', LocalData.energy);
      await inbuilt.put('power', LocalData.power);
      await inbuilt.put('pressure', LocalData.pressure);
      await inbuilt.put('speeds', LocalData.speeds);
      await inbuilt.put('temperature', LocalData.temperature);
      await inbuilt.put('time', LocalData.time);
      await inbuilt.put('volume', LocalData.volume);
      await inbuilt.put('weights', LocalData.weights);
      print('inbuilt values are added  ');
    }
  }
}
