import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CurrencyAPi {
  final String? _apiSecretKey = dotenv.env['API_KEY'];

  Future<Map?> fetchData() async {
    Uri baseUrl = Uri.parse(
        'https://v6.exchangerate-api.com/v6/$_apiSecretKey/latest/INR');
    try {
      http.Response _rep =
          await http.get(baseUrl).timeout(const Duration(minutes: 1));
      if (_rep.statusCode == 200) {
        Map conversionRates = jsonDecode(_rep.body) as Map;
        return conversionRates;
      } else {
        print(_rep.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
