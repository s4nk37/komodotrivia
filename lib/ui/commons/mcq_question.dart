import 'package:flutter/material.dart';
import 'package:komodotrivia/models/quiz_response_model.dart';
import '../../ui/commons/question_card.dart';
import '../../utils/constants/colors_constants.dart';
import '../../utils/constants/layout_constants.dart';

class McqQuestion extends StatefulWidget {
  final QuizResults question;
  final Function(String selectedAns) onTap;

  const McqQuestion({super.key, required this.question, required this.onTap});

  @override
  State<McqQuestion> createState() => _McqQuestionState();
}

class _McqQuestionState extends State<McqQuestion> {
  // onTap() {
  //   reveal = true;
  //   print("REVEALED : $reveal");
  //   setState(() {});
  // }

  // addOptions() {
  //   for (int i = 0; i < widget.question.incorrectAnswers!.length; i++) {
  //     options.add(
  //       OptionCard(
  //         model: OptionModel(
  //             onTap: onTap,
  //             title: widget.question.incorrectAnswers![i],
  //             isFalse: true,
  //             revealAnswer: reveal),
  //       ),
  //     );
  //   }
  //   options.add(OptionCard(
  //     model: OptionModel(
  //         onTap: onTap,
  //         title: widget.question.correctAnswer!,
  //         isFalse: false,
  //         revealAnswer: reveal),
  //   ));
  //   options.shuffle();
  // }

  @override
  void initState() {
    // reveal = false;
    // addOptions();
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

        // // ///OPTIONS
        // OptionCard(
        //     model: OptionModel(
        //         onTap: onTap, title: "a", isFalse: true, revealAnswer: reveal)),
        // OptionCard(
        //     model: OptionModel(
        //         onTap: onTap, title: "b", isFalse: true, revealAnswer: reveal)),
        // OptionCard(
        //     model: OptionModel(
        //         onTap: onTap,
        //         title: "c",
        //         isFalse: false,
        //         revealAnswer: reveal)),
        // OptionCard(
        //     model: OptionModel(
        //         onTap: onTap, title: "d", isFalse: true, revealAnswer: reveal)),
        // ...options
        Column(
          children: List.generate(widget.question.incorrectAnswers?.length ?? 0, (index) {
            return OptionCard(
              model: OptionModel(
                  title: widget.question.incorrectAnswers?[index] ?? '',
                  selectedAnswer: widget.question.selectedAnswers ?? '',
                  correctAnswer: widget.question.correctAnswer ?? ''),
              onTap: (selectedAns) {
                widget.onTap(selectedAns);
              },
            );
          }),
        ),
      ],
    );
  }
}

class OptionModel {
  final String title;

  // final bool isFalse;
  // bool revealAnswer;
  final String selectedAnswer;
  final String correctAnswer;

  OptionModel({
    required this.title,
    required this.selectedAnswer,
    required this.correctAnswer,
    // required this.isFalse,
    // required this.revealAnswer,
  });
}

// import 'package:flutter/material.dart';
// import 'package:komodotrivia/utils/constants/colors_constants.dart';
// import 'package:komodotrivia/utils/constants/layout_constants.dart';
//
// import 'mcq_question.dart';

class OptionCard extends StatelessWidget {
  final OptionModel model;
  final Function(String selectedAns) onTap;

  const OptionCard({
    super.key,
    required this.model,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(model.title);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: model.selectedAnswer.isNotEmpty
              ? (model.selectedAnswer == model.correctAnswer ? AppColors.blueBg : Colors.transparent)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(RadiusConstants.commonRadius),
          border: Border.all(
              width: 2,
              color: model.selectedAnswer.isNotEmpty
                  ? (model.selectedAnswer == model.correctAnswer ? AppColors.blueFont : AppColors.red)
                  : AppColors.borderGrey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                model.title,
                overflow: TextOverflow.clip,
                style: const TextStyle(fontSize: 18, color: AppColors.fontGrey, fontWeight: FontWeight.w500),
              ),
            ),
            Visibility(
              visible: model.selectedAnswer.isNotEmpty,
              child: Column(
                children: [
                  if (model.selectedAnswer != model.correctAnswer)
                    const Icon(
                      Icons.cancel,
                      color: AppColors.red,
                    ),
                  if (model.selectedAnswer == model.correctAnswer)
                    const Icon(
                      Icons.check_circle,
                      color: AppColors.blueFont,
                    ),
                ],
              ),
            ),
            if (model.selectedAnswer.isEmpty)
              const Icon(
                Icons.circle_outlined,
                color: AppColors.borderGrey,
              ),
          ],
        ),
      ),
    );
  }
}
