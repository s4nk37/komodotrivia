// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:komodotrivia/providers/question_provider.dart';

void main() {
  test("No data/Internet check test", () async {
    final result = QuestionProvider();
    await result.fetchAndSetQuestions(categoryId: 100, numberOfQuestions: 10);
    expect(result.questions, []);
  });

  // test("Ranking test", () {
  //
  //   expect(ScoreProvider().calculateGrade(100), "F");
  // });
}
