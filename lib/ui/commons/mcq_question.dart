import 'package:flutter/material.dart';
import 'package:komodotrivia/ui/commons/question_card.dart';

import '../../models/question_model.dart';
import 'option_card.dart';

class McqQuestion extends StatefulWidget {
  final Results question;
  const McqQuestion({super.key, required this.question});

  @override
  State<McqQuestion> createState() => _McqQuestionState();
}

class _McqQuestionState extends State<McqQuestion> {
  List<OptionCard> getOptions() {
    List<OptionCard> options = [];
    for (int i = 0; i < widget.question.incorrectAnswers!.length; i++) {
      options.add(OptionCard(
        title: widget.question.incorrectAnswers![i],
        isSelected: false,
        isFalse: true,
      ));
    }

    options.add(OptionCard(
      title: widget.question.correctAnswer!,
      isSelected: true,
      isFalse: false,
    ));
    options.shuffle();
    return options;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 20),
      children: [
        ///QUESTION CARD
        QuestionCard(
          questionText: widget.question.question!,
        ),
        const SizedBox(
          height: 20,
        ),

        ///OPTIONS CARDS
        ...getOptions()
        // OptionCard(title: widget.question., isSelected: false, isFalse: false),
        // OptionCard(title: "Cricket", isSelected: true, isFalse: false),
        // OptionCard(title: "Basketball", isSelected: false, isFalse: true),
        // OptionCard(title: "Tennis", isSelected: false, isFalse: false),
      ],
    );
  }
}
