import 'package:flutter/cupertino.dart';

class ScoreProvider with ChangeNotifier {
  int totalQuestions = 0;
  int _correctAnswers = 0;
  bool _revealAnswers = false;

  bool get revealAnswers => _revealAnswers;

  set revealAnswers(bool value) {
    _revealAnswers = value;
    notifyListeners();
  }

  void reveal() {
    _revealAnswers = true;
    notifyListeners();
  }

  void incrementCorrectAnswers() {
    _correctAnswers++;
    notifyListeners();
  }

  int get correctAnswers => _correctAnswers;

  int get wrongAnswers {
    return totalQuestions - _correctAnswers;
  }

  void reset() {
    _correctAnswers = 0;
    _revealAnswers = false;
    notifyListeners();
  }

  // List<OptionModel> options = [];/
}
