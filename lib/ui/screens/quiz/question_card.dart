import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/score_provider.dart';
import '../../../utils/constants/colors_constants.dart';

class QuestionCard extends StatefulWidget {
  final String questionText;
  const QuestionCard({super.key, required this.questionText});

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  Timer? _timer;
  int _remainingSeconds;

  _QuestionCardState({int startSeconds = 30})
      : _remainingSeconds = startSeconds;

  void _startCountdown() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (Timer timer) {
      if (_remainingSeconds <= 0) {
        Provider.of<ScoreProvider>(context, listen: false).reveal();
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

  @override
  void initState() {
    _startCountdown();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    print("DISPOSED");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Transform.translate(
            offset: const Offset(0, -35),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 67,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: theme.background),
                ),
                SizedBox(
                  height: 53,
                  width: 53,
                  child: CircularProgressIndicator(
                    value: _remainingSeconds / 30,
                    strokeWidth: 6,
                    color: AppColors.kBlueFont,
                    backgroundColor: AppColors.kBorderGrey,
                    strokeCap: StrokeCap.round,
                  ),
                ),
                Text(
                  "$_remainingSeconds",
                  style:
                      const TextStyle(color: AppColors.kFontGrey, fontSize: 16),
                )
              ],
            ),
          ),

          ///QUESTION TEXT
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Text(
                widget.questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                    overflow: TextOverflow.clip,
                    fontSize: 18,
                    color: theme.onBackground,
                    fontWeight: FontWeight.w700),
              ),
            ),
          )
        ],
      ),
    );
  }
}
