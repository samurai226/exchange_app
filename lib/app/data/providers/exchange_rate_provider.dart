import 'package:get/get.dart';
import '../models/exchange_rate.dart';

class ExchangeRateProvider extends GetConnect {
  Future<List<ExchangeRate>> getRates() async {
    // Ici, vous ferez l'appel à votre API qui contient les données scrapées
    final response = await get('votre_api/rates');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return (response.body as List)
          .map((item) => ExchangeRate.fromJson(item))
          .toList();
    }
  }
}