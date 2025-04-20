import 'dart:developer';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://app-interview.easyglue.in';

  Future<http.Response> get(String endpoint, {Map<String, String>? headers}) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.get(uri, headers: headers);
      log('GET $uri -> ${response.statusCode}');
      return response;
    } catch (e) {
      log('Error during GET request: $e');
      rethrow;
    }
  }

}
