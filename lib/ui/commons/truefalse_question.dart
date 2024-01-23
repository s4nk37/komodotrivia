import 'package:flutter/material.dart';

import '../../utils/constants/strings_constants.dart';
import 'option_card.dart';
import 'question_card.dart';

class TrueFalseQuestion extends StatefulWidget {
  const TrueFalseQuestion({super.key});

  @override
  State<TrueFalseQuestion> createState() => _TrueFalseQuestionState();
}

class _TrueFalseQuestionState extends State<TrueFalseQuestion> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 20),
      children: const [
        ///QUESTION CARD
        QuestionCard(
          questionText: "a",
        ),
        SizedBox(
          height: 20,
        ),

        ///OPTIONS CARDS
        OptionCard(title: Strings.trueString, isSelected: false, isFalse: true),
        OptionCard(
            title: Strings.falseString, isSelected: true, isFalse: false),
      ],
    );
  }
}
