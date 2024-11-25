import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NetworkUtils {
  final Dio dioClient = Dio();

  static String buildUrl(String isbn) {
    final baseUrl = dotenv.env['GOOGLE_BOOKS_API_URL'];
    final apiKey = dotenv.env['GOOGLE_BOOKS_API_KEY'];

    if (baseUrl == null || apiKey == null) {
      throw Exception("Missing API URL or Key in .env file");
    }

    return "$baseUrl?q=isbn:$isbn&key=$apiKey";
  }

  Future<Response> get(String url) async {
    return await dioClient.get(url);
  }
}
