import 'package:flutter/material.dart';

import '../ui/screens/home_screen.dart';
import '../ui/screens/question_screen.dart';

class Routes {
  static const String splashScreen = '/';
  static const String homeScreen = '/home_screen';
  static const String questionScreen = '/question_screen';

  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.homeScreen: (context) => const HomeScreen(),
    Routes.questionScreen: (context) => const QuestionScreen(),
  };
}
