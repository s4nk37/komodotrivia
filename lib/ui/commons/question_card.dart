import 'package:flutter/material.dart';

import '../../utils/constants/colors_constants.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key});

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
                const SizedBox(
                  height: 53,
                  width: 53,
                  child: CircularProgressIndicator(
                    value: 0.7,
                    strokeWidth: 6,
                    color: AppColors.blueFont,
                    backgroundColor: AppColors.borderGrey,
                    strokeCap: StrokeCap.round,
                  ),
                ),
                const Text(
                  "10",
                  style: TextStyle(color: AppColors.fontGrey, fontSize: 16),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          ///QUESTION TEXT
          const Text(
            "What is the most popular sports in history?",
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 18,
                color: AppColors.fontBlack,
                fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
