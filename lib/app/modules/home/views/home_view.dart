import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taux de Change'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: controller.fetchRates,
          ),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Card pour le montant source
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Montant',
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                controller.amount.value =
                                    double.tryParse(value) ?? 0.0;
                              },
                            ),
                            SizedBox(height: 16),
                            DropdownButton<String>(
                              value: controller.selectedFromCurrency.value,
                              items: ['EUR', 'USD', 'GBP']
                                  .map((currency) => DropdownMenuItem(
                                        value: currency,
                                        child: Text(currency),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.selectedFromCurrency.value = value!;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    // Icône d'échange
                    IconButton(
                      icon: Icon(Icons.swap_vert),
                      onPressed: () {
                        final temp = controller.selectedFromCurrency.value;
                        controller.selectedFromCurrency.value =
                            controller.selectedToCurrency.value;
                        controller.selectedToCurrency.value = temp;
                      },
                    ),

                    // Card pour le montant cible
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Obx(
                              () => Text(
                                '${controller.calculateExchange(
                                  controller.amount.value,
                                  controller.selectedFromCurrency.value,
                                  controller.selectedToCurrency.value,
                                ).toStringAsFixed(2)} ${controller.selectedToCurrency.value}',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            DropdownButton<String>(
                              value: controller.selectedToCurrency.value,
                              items: ['XAF', 'XOF', 'MAD']
                                  .map((currency) => DropdownMenuItem(
                                        value: currency,
                                        child: Text(currency),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.selectedToCurrency.value = value!;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}