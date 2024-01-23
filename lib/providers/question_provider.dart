import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../models/question_model.dart';
import '../utils/constants/api_constants.dart';

class QuestionProvider with ChangeNotifier {
  Question _questions = Question();
  final dio = Dio();

  List<Results>? get questions {
    return _questions.results;
  }

  Future<void> fetchAndSetQuestions() async {
    final url = Uri.parse(APIConstants.baseUrl);
    try {
      // final response = await http.get(url);
      final response = await dio.get(
        url.toString(),
        queryParameters: {'amount': 50, 'category': 21},
      );
      print(response.data);
      final loadedQuestions = Question.fromJson(response.data);
      print(loadedQuestions.results!.length);
      _questions = loadedQuestions;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
