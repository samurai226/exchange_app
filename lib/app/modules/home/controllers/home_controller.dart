import 'package:get/get.dart';
import '../../../data/models/exchange_rate.dart';
import '../../../data/providers/exchange_rate_provider.dart';

class HomeController extends GetxController {
  final ExchangeRateProvider provider = ExchangeRateProvider();
  final rates = <ExchangeRate>[].obs;
  final isLoading = false.obs;
  final selectedFromCurrency = 'EUR'.obs;
  final selectedToCurrency = 'XAF'.obs;
  final amount = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRates();
  }

  Future<void> fetchRates() async {
    try {
      isLoading(true);
      final fetchedRates = await provider.getRates();
      rates.value = fetchedRates;
    } catch (e) {
      Get.snackbar(
        'Erreur',
        'Impossible de récupérer les taux de change',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }

  double calculateExchange(double amount, String from, String to) {
    final rate = rates.firstWhere(
      (rate) => rate.fromCurrency == from && rate.toCurrency == to,
      orElse: () => ExchangeRate(
        fromCurrency: from,
        toCurrency: to,
        rate: 1.0,
        provider: 'default',
        timestamp: DateTime.now(),
      ),
    );
    return amount * rate.rate;
  }
}