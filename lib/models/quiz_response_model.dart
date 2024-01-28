class QuizResponseModel {
  int? responseCode;
  List<QuizResults>? results;

  QuizResponseModel({this.responseCode, this.results});

  QuizResponseModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    if (json['results'] != null) {
      results = <QuizResults>[];
      json['results'].forEach((v) {
        results!.add(QuizResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response_code'] = responseCode;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuizResults {
  String? type;
  String? difficulty;
  String? category;
  String? question;
  String? correctAnswer;
  String? selectedAnswers;
  List<String>? incorrectAnswers;

  QuizResults(
      {this.type,
        this.difficulty,
        this.category,
        this.question,
        this.correctAnswer,
        this.selectedAnswers,
        this.incorrectAnswers});

  QuizResults.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    difficulty = json['difficulty'];
    category = json['category'];
    question = json['question'];
    correctAnswer = json['correct_answer'];
    selectedAnswers = json['selected_answers'];
    incorrectAnswers = json['incorrect_answers'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['difficulty'] = difficulty;
    data['category'] = category;
    data['question'] = question;
    data['correct_answer'] = correctAnswer;
    data['selected_answers'] = selectedAnswers;
    data['incorrect_answers'] = incorrectAnswers;
    return data;
  }

  static Future<QuizResponseModel?> parseInfo(Map<String, dynamic>? json) async {
    try {
      return QuizResponseModel.fromJson(json ?? {});
    } catch (e) {
      // Logger().e("QuizResponseModel exception : $e");
      return null;
    }
  }
}
