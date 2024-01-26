import 'package:dio/dio.dart';
import 'package:html_unescape/html_unescape.dart';

class APIConstants {
  static const String baseUrl = "https://opentdb.com";
  static const String categoryUrl = "https://opentdb.com/api_category.php";
}

final dio = Dio(
  BaseOptions(
    baseUrl: APIConstants.baseUrl,
    connectTimeout: const Duration(seconds: 20),
    receiveTimeout: const Duration(seconds: 20),
    headers: {
      'Accept': 'application/json',
    },
  ),
);

var unescape = HtmlUnescape();
