import 'package:flutter/material.dart';

import '../ui/screens/home/home_screen.dart';
import '../ui/screens/quiz/question_screen.dart';
import '../ui/screens/quiz/quiz_end_screen.dart';

class Routes {
  Routes._(); // this basically makes it so you can't instantiate this class

  static const String splashScreen = '/';
  static const String homeScreen = '/home_screen';
  static const String questionScreen = '/question_screen';
  static const String quizEndScreen = '/quiz_end_screen';

  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.homeScreen: (context) => const HomeScreen(),
    Routes.questionScreen: (context) => const QuestionScreen(),
    Routes.quizEndScreen: (context) => const QuizEndScreen(),
  };
}
