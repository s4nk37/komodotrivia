import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/score_provider.dart';
import '../../../utils/constants/colors_constants.dart';
import '../../../utils/constants/layout_constants.dart';
import 'mcq_question.dart';

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
    bool revealAnswer = Provider.of<ScoreProvider>(context).revealAnswers;
    final theme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        if (!revealAnswer) {
          if (!widget.model.isFalse) {
            Provider.of<ScoreProvider>(context, listen: false)
                .incrementCorrectAnswers();
          }
          Provider.of<ScoreProvider>(context, listen: false).reveal();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: revealAnswer
              ? (widget.model.isFalse
                  ? Colors.transparent
                  : theme.primaryContainer)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(RadiusConstants.kCommonRadius),
          border: Border.all(
              width: 2,
              color: revealAnswer
                  ? (widget.model.isFalse
                      ? AppColors.kRed
                      : AppColors.kBlueFont)
                  : AppColors.kBorderGrey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                widget.model.title,
                overflow: TextOverflow.clip,
                style: TextStyle(
                    fontSize: 18,
                    color: revealAnswer
                        ? (widget.model.isFalse
                            ? AppColors.kRed
                            : AppColors.kBlueFont)
                        : AppColors.kFontGrey,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Visibility(
                visible: revealAnswer,
                child: Column(
                  children: [
                    if (widget.model.isFalse)
                      const Icon(
                        Icons.cancel,
                        color: AppColors.kRed,
                      ),
                    if (!widget.model.isFalse)
                      const Icon(
                        Icons.check_circle,
                        color: AppColors.kBlueFont,
                      ),
                  ],
                )),
            if (!revealAnswer)
              const Icon(
                Icons.circle_outlined,
                color: AppColors.kBorderGrey,
              ),
          ],
        ),
      ),
    );
  }
}
