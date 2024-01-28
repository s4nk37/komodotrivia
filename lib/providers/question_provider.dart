import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:komodotrivia/models/quiz_response_model.dart';

import '../models/question_model.dart';
import '../utils/constants/api_constants.dart';

class QuestionProvider with ChangeNotifier {
  List<Results>? _questions;
  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  List<Results>? get questions {
    return _questions;
  }

  List<QuizResults>? get quizResults => _quizResults;
  List<QuizResults> _quizResults = [];



  Future<void> fetchAndSetQuestions({required int categoryId, required int numberOfQuestions}) async {
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
        _quizResults.clear();
        _quizResults.addAll(QuizResponseModel.fromJson(response.data).results ?? []);

        for(var element in _quizResults){
          element.incorrectAnswers?.add(element.correctAnswer ?? '');
          element.incorrectAnswers?.shuffle();
        }
        _isLoading = false;
        notifyListeners();
      } else {
        print("GOT ERROR RESPONSE: ${response.statusCode}");
      }
    } catch (error) {
      rethrow;
    }
  }

  void addSelectedAnswer({required int index, required String selectedAns}){
    _quizResults[index].selectedAnswers = selectedAns;
    notifyListeners();
  }

}
