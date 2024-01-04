import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/article.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  static final String _baseUrl = dotenv.get('BASE_URL');
  static final String _apiKey = dotenv.get('API_KEY');
  static const String _category = 'business';
  static const String _country = 'us';

  Future<ArticlesResult> topHeadlines() async {
    final response = await http.get(Uri.parse(
        "${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey"));
    if (response.statusCode == 200) {
      return ArticlesResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
