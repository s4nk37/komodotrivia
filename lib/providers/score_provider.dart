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

  List<int> thresholds = [
    1170, // A+
    1070, // A
    970, // A-
    870, // B+
    770, // B
    670, // B-
    570, // C+
    470, // C
    370, // C-
    270, // D+
    170, // D
    0, // F
  ];

// Function to calculate grade based on points
  String calculateGrade(int points) {
    if (points < 0 || points > 1300) {
      throw ArgumentError('Points must be between 0 and 1300.');
    }

    // Linear search (optimized for efficiency)
    for (int i = 0; i < thresholds.length; i++) {
      if (points >= thresholds[i]) {
        return grades[i];
      }
    }

    // Should never reach here, but ensure safety
    return 'F';
  }

// Define grade letter mappings (can be easily modified)
  List<String> grades = [
    'A+',
    'A',
    'A-',
    'B+',
    'B',
    'B-',
    'C+',
    'C',
    'C-',
    'D+',
    'D',
    'F',
  ];

  void updatePoints() {
    categoryPoints[currentCategory] = correctAnswers * 10;
    _points = categoryPoints.values.reduce((a, b) => a + b);
    ranking = calculateGrade(points);

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
