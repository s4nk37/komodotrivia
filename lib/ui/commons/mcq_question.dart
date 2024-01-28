import 'package:flutter/material.dart';
import '../../ui/commons/question_card.dart';

import '../../models/question_model.dart';
import '../../utils/constants/colors_constants.dart';
import '../../utils/constants/layout_constants.dart';
import 'option_card.dart';

class McqQuestion extends StatefulWidget {
  final Results question;
  const McqQuestion({super.key, required this.question});

  @override
  State<McqQuestion> createState() => _McqQuestionState();
}

class _McqQuestionState extends State<McqQuestion> {
  List<OptionCard> options = [];
  bool reveal = false;

  onTap() {
    reveal = true;
    print("REVEALED : $reveal");
    setState(() {});
  }

  addOptions() {
    for (int i = 0; i < widget.question.incorrectAnswers!.length; i++) {
      options.add(
        OptionCard(
          model: OptionModel(
              onTap: onTap,
              title: widget.question.incorrectAnswers![i],
              isFalse: true,
              revealAnswer: reveal),
        ),
      );
    }
    options.add(OptionCard(
      model: OptionModel(
          onTap: onTap,
          title: widget.question.correctAnswer!,
          isFalse: false,
          revealAnswer: reveal),
    ));
    options.shuffle();
  }

  @override
  void initState() {
    reveal = false;
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
          children: List.generate(options.length, (index) => options[index]),
        ),
      ],
    );
  }
}

class OptionModel {
  final String title;
  final bool isFalse;
  bool revealAnswer;
  final Function onTap;

  OptionModel({
    required this.onTap,
    required this.title,
    required this.isFalse,
    required this.revealAnswer,
  });
}

// import 'package:flutter/material.dart';
// import 'package:komodotrivia/utils/constants/colors_constants.dart';
// import 'package:komodotrivia/utils/constants/layout_constants.dart';
//
// import 'mcq_question.dart';

class OptionCard extends StatefulWidget {
  final OptionModel model;

  const OptionCard({
    super.key,
    required this.model,
  });

  @override
  State<OptionCard> createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.model.onTap();
        print("Revel: ${widget.model.revealAnswer}");
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: widget.model.revealAnswer
              ? (widget.model.isFalse ? Colors.transparent : AppColors.blueBg)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(RadiusConstants.commonRadius),
          border: Border.all(
              width: 2,
              color: widget.model.revealAnswer
                  ? (widget.model.isFalse ? AppColors.red : AppColors.blueFont)
                  : AppColors.borderGrey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                widget.model.title,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.fontGrey,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Visibility(
                visible: widget.model.revealAnswer,
                child: Column(
                  children: [
                    if (widget.model.isFalse)
                      const Icon(
                        Icons.cancel,
                        color: AppColors.red,
                      ),
                    if (!widget.model.isFalse)
                      const Icon(
                        Icons.check_circle,
                        color: AppColors.blueFont,
                      ),
                  ],
                )),
            if (!widget.model.revealAnswer)
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
