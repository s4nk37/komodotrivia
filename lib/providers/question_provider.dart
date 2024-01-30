import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../models/question_model.dart';
import '../utils/configs/app_config.dart';

class QuestionProvider with ChangeNotifier {
  List<Results>? _questions;
  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  List<Results>? get questions {
    return _questions;
  }

  Future<void> fetchAndSetQuestions(
      {required int categoryId, required int numberOfQuestions}) async {
    _isLoading = true;

    try {
      print("API CALLED");
      final response = await dio.get(
        "/api.php",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        queryParameters: {'amount': numberOfQuestions, 'category': categoryId},
      );

      if (response.statusCode == 200) {
        print("GOT RESPONSE: ${response.data}");

        final loadedQuestions = QuestionResponse.fromJson(response.data);
        _questions = loadedQuestions.results;
        _isLoading = false;
        notifyListeners();
      } else {
        print("GOT ERROR RESPONSE: ${response.statusCode}");
      }
    } catch (error) {
      rethrow;
    }
  }
}
