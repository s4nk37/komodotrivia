import 'package:flutter/material.dart';

class Score {
  int totalQuestions;
  int correctAnswers;
  int incorrectAnswers;
  int unattempted;

  Score(
      {required this.totalQuestions,
      required this.correctAnswers,
      required this.incorrectAnswers,
      required this.unattempted});
}
