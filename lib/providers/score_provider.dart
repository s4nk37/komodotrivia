import 'package:flutter/cupertino.dart';

class ScoreProvider with ChangeNotifier {
  int totalQuestions = 0;
  int _correctAnswers = 0;

  void incrementCorrectAnswers() {
    _correctAnswers++;
    notifyListeners();
  }

  int get correctAnswers => _correctAnswers;

  int get wrongAnswers {
    return totalQuestions - _correctAnswers;
  }

  // List<OptionModel> options = [];/
}
