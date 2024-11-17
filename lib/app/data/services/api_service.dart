import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = "http://localhost:3000/api";

  Future<Map<String, dynamic>> getRates() async {
    final response = await http.get(Uri.parse("$baseUrl/rates"));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load rates");
    }
  }
}
