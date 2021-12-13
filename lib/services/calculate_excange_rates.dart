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
}
