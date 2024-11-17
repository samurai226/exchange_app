import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ExchangeRateController extends GetxController {
  var exchangeRates = {}.obs;

  Future<void> fetchExchangeRates() async {
    final response = await http.get(Uri.parse('https://votre-api.com/rates'));
    if (response.statusCode == 200) {
      exchangeRates.value = jsonDecode(response.body);
    }
  }
}
