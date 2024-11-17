import 'package:flutter/material.dart';


class ExchangeRateCard extends StatelessWidget {
  final String fromCurrency;
  final String toCurrency;
  final double rate;
  final bool isIncreasing;

  ExchangeRateCard({
    required this.fromCurrency,
    required this.toCurrency,
    required this.rate,
    this.isIncreasing = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$fromCurrency to $toCurrency',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '1 $fromCurrency = ${rate.toStringAsFixed(2)} $toCurrency',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
          Icon(
            isIncreasing ? Icons.arrow_upward : Icons.arrow_downward,
            color: isIncreasing ? Colors.green : Colors.red,
          ),
        ],
      ),
    );
  }
}
