class Rates {
  final Map<String, dynamic>? rates;

  const Rates({
    this.rates,
  });

  num? getRates(String from, String to, num value) {
    num? _fromRate = rates![from];
    num? _toRate = rates![to];
    if (_fromRate != null && _toRate != null) {
      num ans = _toRate / _fromRate * value;
      if (ans is int) {
        return ans;
      } else {
        return num.parse(ans.toStringAsFixed(4));
      }
    } else {
      return 0.0;
    }
  }

  static num? getTemperature(String from, String to, num value) {
    if (from == to) return value;
    if (from == 'Farhenheit') {
      if (to == 'Celcius') return (value - 32) / 1.8;
      return ((value - 32) / 1.8) + 273.15;
    } else if (from == 'Celcius') {
      if (to == 'Kelvin') return value + 273.15;
      return value * 1.8 + 32;
    } else if (from == 'Kelvin') {
      if (to == 'Celcius') return value - 273.15;
      return ((value - 273.15) * 1.8) + 32;
    } else {
      return 0.0;
    }
  }
}
