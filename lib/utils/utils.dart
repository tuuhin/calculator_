import 'package:intl/intl.dart';

class Utils {
  static String? convertToReadable(int timestamp) {
    DateFormat _format = DateFormat('jm');
    DateTime _time = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    _format.format(_time);
  }
}
