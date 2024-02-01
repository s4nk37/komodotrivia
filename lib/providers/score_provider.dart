import 'package:flutter/cupertino.dart';
import 'package:komodotrivia/utils/configs/app_config.dart';

import '../utils/constants/strings_constants.dart';

class ScoreProvider with ChangeNotifier {
  int totalQuestions = 0;
  int _correctAnswers = 0;
  bool _revealAnswers = false;
  int _points = 0;
  String ranking = "D";
  int currentCategory = 0; //total points

  ScoreProvider() {
    getScoresAtInit();
  }

  getScoresAtInit() {
    _points = prefs.getInt(Strings.kPoints) ?? 0;
    ranking = prefs.getString(Strings.kRanking) ?? "D";
    categoryPoints[21] = prefs.getInt("21") ?? 0;
    categoryPoints[22] = prefs.getInt("22") ?? 0;
    categoryPoints[23] = prefs.getInt("23") ?? 0;
    categoryPoints[19] = prefs.getInt("19") ?? 0;
    categoryPoints[17] = prefs.getInt("17") ?? 0;
    notifyListeners();
  }

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

    prefs.setInt(Strings.kPoints, _points);
    prefs.setInt("21", categoryPoints[21]!);
    prefs.setInt("22", categoryPoints[22]!);
    prefs.setInt("23", categoryPoints[23]!);
    prefs.setInt("19", categoryPoints[19]!);
    prefs.setInt("17", categoryPoints[17]!);
    prefs.setString(Strings.kRanking, ranking);
    notifyListeners();
  }
}
