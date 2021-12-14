import 'package:hive_flutter/hive_flutter.dart';

class InBuiltConvertor {
  static Box? inbuilt;
  static Future init() async {
    inbuilt = await Hive.openBox('inbuilt');
  }

  //  await inbuilt.put('length', LocalData.length);
  //     await inbuilt.put('energy', LocalData.energy);
  //     await inbuilt.put('power', LocalData.power);
  //     await inbuilt.put('pressure', LocalData.pressure);
  //     await inbuilt.put('speeds', LocalData.speeds);
  //     await inbuilt.put('temperature', LocalData.temperature);
  //     await inbuilt.put('time', LocalData.time);
  //     await inbuilt.put('volume', LocalData.volume);
  //     await inbuilt.put('weights', LocalData.weights);

  static Map<String, dynamic>? getLengthData() {
    return inbuilt!.get('length').cast<String, dynamic>();
  }

  static Map<String, dynamic>? getTimeData() {
    return inbuilt!.get('time').cast<String, dynamic>();
  }

  static Map<String, dynamic>? getVolumeData() {
    return inbuilt!.get('volume').cast<String, dynamic>();
  }

  static Map<String, dynamic>? getWeightsData() {
    return inbuilt!.get('weights').cast<String, dynamic>();
  }

  static Map<String, dynamic>? getEnergyData() {
    return inbuilt!.get('energy').cast<String, dynamic>();
  }

  static Map<String, dynamic>? getPowerData() {
    return inbuilt!.get('power').cast<String, dynamic>();
  }

  static Map<String, dynamic>? getPressureData() {
    return inbuilt!.get('pressure').cast<String, dynamic>();
  }

  static Map<String, dynamic>? getSpeedData() {
    return inbuilt!.get('speeds').cast<String, dynamic>();
  }

  static List<String>? getTemperatureData() {
    return inbuilt!.get('temperature');
  }
}
