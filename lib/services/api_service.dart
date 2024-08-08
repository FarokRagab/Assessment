import 'dart:convert';

import 'package:assessment/utils/constants/app_strings.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;
  final http.Client client;

  ApiService({
    required this.baseUrl,
    required this.client,
  });

  Future<Map<String, dynamic>> getUserData(String userId) async {
    final response = await client.get(Uri.parse('$baseUrl/user/$userId'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(AppStrings.failedToLoadUserData);
    }
  }
}
