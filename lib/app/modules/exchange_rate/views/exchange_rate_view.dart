import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/exchange_rate_controller.dart';

class ExchangeRateView extends GetView<ExchangeRateController> {
  const ExchangeRateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exchange Rates")),
      body: Obx(() {
        if (controller.exchangeRates.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView(
            children: controller.exchangeRates.entries.map((entry) {
              return ListTile(
                title: Text(entry.key),
                subtitle: Text(entry.value.toString()),
              );
            }).toList(),
          );
        }
      }),
    );
  }
}
