class ExchangeRate {
  final String fromCurrency;
  final String toCurrency;
  final double rate;
  final String provider;
  final DateTime timestamp;

  ExchangeRate({
    required this.fromCurrency,
    required this.toCurrency,
    required this.rate,
    required this.provider,
    required this.timestamp,
  });

  factory ExchangeRate.fromJson(Map<String, dynamic> json) {
    return ExchangeRate(
      fromCurrency: json['from_currency'],
      toCurrency: json['to_currency'],
      rate: json['rate'].toDouble(),
      provider: json['provider'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}