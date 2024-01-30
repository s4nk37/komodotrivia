import 'package:flutter/cupertino.dart';

class ScoreProvider with ChangeNotifier {
  int totalQuestions = 0;
  int _correctAnswers = 0;
  bool _revealAnswers = false;
  int _points = 0;
  String ranking = "D";
  int currentCategory = 0; //total points

  int get points => _points;

  Map<int, int> categoryPoints = {
    21: 0, //Sports
    22: 0, //Geography
    23: 0, //History
    19: 0, //Maths
    17: 0, //Science
  };

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
    currentCategory = 0;
    notifyListeners();
  }

  void updatePoints() {
    categoryPoints[currentCategory] = correctAnswers * 10;
    _points = categoryPoints.values.reduce((a, b) => a + b);
    if (_points >= 9000) {
      ranking = 'A';
    } else if (_points >= 8000) {
      ranking = 'B';
    } else if (_points >= 7000) {
      ranking = 'C';
    } else if (_points >= 6000) {
      ranking = 'D';
    } else {
      ranking = 'F';
    }
    print(_points);
    notifyListeners();
  }
}
