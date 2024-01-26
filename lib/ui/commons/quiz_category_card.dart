import 'package:flutter/material.dart';
import 'package:komodotrivia/utils/constants/layout_constants.dart';
import 'package:provider/provider.dart';

import '../../providers/question_provider.dart';
import '../../utils/constants/colors_constants.dart';
import '../../utils/routes.dart';
import '../../utils/styles/simple_shadow.dart';

class QuizCategoryCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final int numberOfQuestions;
  final int id;
  const QuizCategoryCard(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.numberOfQuestions,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<QuestionProvider>(context, listen: false)
            .fetchAndSetQuestions(
                categoryId: id, numberOfQuestions: numberOfQuestions);
        Navigator.pushNamed(context, Routes.questionScreen);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(4, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(RadiusConstants.cardRadius),
        ),
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: const Offset(0, -20),
              child: SimpleShadow(
                opacity: 0.3, // Default: 0.5
                color: Colors.black, // Default: Black
                offset: const Offset(12, 55), // Default: Offset(2, 2)
                sigma: 14,
                child: Image.asset(imagePath),
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: AppColors.fontBlack),
            ),
            Text(
              "$numberOfQuestions questions",
              style: const TextStyle(
                color: AppColors.greyBg,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
