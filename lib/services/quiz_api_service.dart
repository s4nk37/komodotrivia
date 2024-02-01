import 'package:dio/dio.dart';

import '../models/question_model.dart';
import '../utils/configs/app_config.dart';
import '../utils/constants/api_constants.dart';

class QuizAPIService {
  QuizAPIService._();

  static Future<List<Results>?> getQuestions(
      {required int categoryId, required int numberOfQuestions}) async {
    try {
      print("$categoryId QUIZ API CALLED");
      final response = await dio.get(
        APIConstants.kEndPointApi,
        queryParameters: {'amount': numberOfQuestions, 'category': categoryId},
      );

      if (response.statusCode == 200) {
        print("GOT RESPONSE: ${response.data}");

        final loadedQuestions = QuestionResponse.fromJson(response.data);
        return loadedQuestions.results;
      }
    } on DioException catch (e) {
      print("DIO EXCEPTION: $e");
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
    return null;
  }
}
