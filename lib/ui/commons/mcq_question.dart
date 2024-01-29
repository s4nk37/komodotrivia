import 'package:flutter/material.dart';
import '../../ui/commons/question_card.dart';

import '../../models/question_model.dart';
import 'option_card.dart';

class McqQuestion extends StatefulWidget {
  final Results question;
  const McqQuestion({super.key, required this.question});

  @override
  State<McqQuestion> createState() => _McqQuestionState();
}

class _McqQuestionState extends State<McqQuestion> {
  List<OptionCard> options = [];

  addOptions() {
    for (int i = 0; i < widget.question.incorrectAnswers!.length; i++) {
      options.add(
        OptionCard(
          model: OptionModel(
            title: widget.question.incorrectAnswers![i],
            isFalse: true,
          ),
        ),
      );
    }
    options.add(OptionCard(
      model: OptionModel(
        title: widget.question.correctAnswer!,
        isFalse: false,
      ),
    ));
    if (widget.question.type == 'multiple') {
      options.shuffle();
    } else {
      options.reversed;
    }
  }

  @override
  void initState() {
    addOptions();

    super.initState();
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

        ///OPTIONS
        ...options
      ],
    );
  }
}

class OptionModel {
  final String title;
  final bool isFalse;

  OptionModel({
    required this.title,
    required this.isFalse,
  });
}
