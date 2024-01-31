import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:komodotrivia/utils/constants/api_constants.dart';

import '../models/question_model.dart';
import '../utils/configs/app_config.dart';

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

    try {
      print("$categoryId QUIZ API CALLED");
      final response = await dio.get(
        APIConstants.kEndPointApi,
        queryParameters: {'amount': numberOfQuestions, 'category': categoryId},
      );

      if (response.statusCode == 200) {
        print("GOT RESPONSE: ${response.data}");

        final loadedQuestions = QuestionResponse.fromJson(response.data);
        _questions = loadedQuestions.results;
      }
      _isLoading = false;
      notifyListeners();
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    } catch (error) {
      rethrow;
    }
  }
}
