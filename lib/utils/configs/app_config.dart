import 'package:dio/dio.dart';
import 'package:html_unescape/html_unescape.dart';

import '../constants/api_constants.dart';

const String kAppTitle = "Komodo Trivia";
const String kAppFont = "Roboto";

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
