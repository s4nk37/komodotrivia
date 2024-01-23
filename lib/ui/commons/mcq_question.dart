import 'package:flutter/material.dart';
import 'package:komodotrivia/ui/commons/question_card.dart';
import 'package:komodotrivia/utils/constants/colors_constants.dart';

import 'option_card.dart';

class McqQuestion extends StatefulWidget {
  const McqQuestion({super.key});

  @override
  State<McqQuestion> createState() => _McqQuestionState();
}

class _McqQuestionState extends State<McqQuestion> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 20),
      children: [
        ///QUESTION CARD
        QuestionCard(),
        const SizedBox(
          height: 20,
        ),

        ///OPTIONS CARDS
        const OptionCard(title: "Football", isSelected: false, isFalse: false),
        const OptionCard(title: "Cricket", isSelected: true, isFalse: false),
        const OptionCard(title: "Basketball", isSelected: false, isFalse: true),
        const OptionCard(title: "Tennis", isSelected: false, isFalse: false),
      ],
    );
  }
}
