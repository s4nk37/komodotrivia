import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils/constants/colors_constants.dart';

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.blueBg,
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
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.bgWhite),
                ),
                SizedBox(
                  height: 53,
                  width: 53,
                  child: CircularProgressIndicator(
                    value: _remainingSeconds / 30,
                    strokeWidth: 6,
                    color: AppColors.blueFont,
                    backgroundColor: AppColors.borderGrey,
                    strokeCap: StrokeCap.round,
                  ),
                ),
                Text(
                  "$_remainingSeconds",
                  style:
                      const TextStyle(color: AppColors.fontGrey, fontSize: 16),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          ///QUESTION TEXT
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              // "What is the most popular sports in history?",
              widget.questionText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  overflow: TextOverflow.clip,
                  fontSize: 18,
                  color: AppColors.fontBlack,
                  fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}
