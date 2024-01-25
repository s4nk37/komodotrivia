import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../models/question_model.dart';
import '../utils/constants/api_constants.dart';

class QuestionProvider with ChangeNotifier {
  Question _questions = Question();
  final dio = Dio();

  List<Results>? get questions {
    return _questions.results;
  }

  Future<void> fetchAndSetQuestions(
      {required int categoryId, required int numberOfQuestions}) async {
    final url = Uri.parse(APIConstants.baseUrl);
    try {
      print("API CALLED");
      final response = await dio.get(
        url.toString(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        queryParameters: {'amount': numberOfQuestions, 'category': categoryId},
      );
      print("GOT RESPONSE: $response");
      if (response.statusCode == 200) {
        final data = json.decode(response.data);
        final loadedQuestions = Question.fromJson(data);
        _questions = loadedQuestions;
        notifyListeners();
      } else {
        print("GOT ERROR RESPONSE: ${response.statusCode}");
      }
    } catch (error) {
      throw (error);
    }
  }
}
