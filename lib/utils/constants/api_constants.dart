import 'package:dio/dio.dart';
import 'package:html_unescape/html_unescape.dart';

class APIConstants {
  static const String kBaseUrl = "https://opentdb.com";
  static const String kCategoryUrl = "https://opentdb.com/api_category.php";
}

final dio = Dio(
  BaseOptions(
    baseUrl: APIConstants.kBaseUrl,
    connectTimeout: const Duration(seconds: 20),
    receiveTimeout: const Duration(seconds: 20),
    headers: {
      'Accept': 'application/json',
    },
  ),
);

var unescape = HtmlUnescape();
