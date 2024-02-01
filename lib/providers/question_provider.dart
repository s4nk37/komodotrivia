import 'package:flutter/material.dart';

import '../models/question_model.dart';
import '../services/quiz_api_service.dart';

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
    _questions = null;

    _questions = await QuizAPIService.getQuestions(
        categoryId: categoryId, numberOfQuestions: numberOfQuestions);
    _isLoading = false;
    notifyListeners();
  }
}
