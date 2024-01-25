import 'package:flutter/material.dart';
import 'package:komodotrivia/providers/question_provider.dart';
import 'package:komodotrivia/ui/commons/mcq_question.dart';
import 'package:komodotrivia/utils/constants/layout_constants.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/constants/colors_constants.dart';
import '../../utils/constants/strings_constants.dart';
import '../../utils/routes.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int _currentQuestion = 0;

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments
        as List<int>; //id,noOfQuestions
    final loadedQuestions = Provider.of<QuestionProvider>(context).questions;
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: Provider.of<QuestionProvider>(context).fetchAndSetQuestions(
                categoryId: data[0], numberOfQuestions: data[1]),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return Padding(
                  padding: PaddingConstants.scaffoldPadding
                      .copyWith(top: 24, bottom: 24),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 26,
                      ),

                      ///PROGRESS BAR
                      Row(
                        children: [
                          GestureDetector(
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.borderGrey),
                              ),
                              child: const Icon(
                                Icons.close,
                                color: AppColors.greyBg,
                                size: 26,
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 34,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.borderGrey),
                                borderRadius: BorderRadius.circular(
                                    RadiusConstants.barRadius),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      value: (_currentQuestion + 1) /
                                          loadedQuestions!.length,
                                      minHeight: 10,
                                      color: AppColors.orange,
                                      backgroundColor: AppColors.borderGrey,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(
                                              RadiusConstants.barRadius)),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${_currentQuestion + 1}/${loadedQuestions.length}",
                                    style: const TextStyle(
                                        color: AppColors.blueFont,
                                        fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      ///QUESTION CARD
                      Expanded(
                        key: UniqueKey(),
                        child: McqQuestion(
                          question: loadedQuestions[_currentQuestion],
                        ),
                        //child: TrueFalseQuestion(),
                      ),

                      ///NEXT BUTTON
                      GestureDetector(
                        onTap: () {
                          if (_currentQuestion + 1 == loadedQuestions.length) {
                            Navigator.pushNamed(context, Routes.quizEndScreen);
                          } else {
                            _currentQuestion++;
                            setState(() {});
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          decoration: BoxDecoration(
                              color: AppColors.blueFont,
                              borderRadius: BorderRadius.circular(
                                  RadiusConstants.commonRadius)),
                          child: const Center(
                            child: Text(
                              Strings.next,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("Connection Timeout"),
                );
              } else {
                print(snapshot.error);
                return Shimmer.fromColors(
                  baseColor: AppColors.borderGrey,
                  highlightColor: AppColors.blueBg,
                  child: Padding(
                    padding: PaddingConstants.scaffoldPadding
                        .copyWith(top: 24, bottom: 24),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 26,
                        ),

                        ///PROGRESS BAR
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.borderGrey),
                              ),
                              child: const Icon(
                                Icons.close,
                                color: AppColors.greyBg,
                                size: 26,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                height: 34,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.borderGrey),
                                  borderRadius: BorderRadius.circular(
                                      RadiusConstants.barRadius),
                                ),
                                child: const Row(
                                  children: [
                                    Expanded(
                                      child: LinearProgressIndicator(
                                        value: 1,
                                        minHeight: 10,
                                        color: AppColors.orange,
                                        backgroundColor: AppColors.borderGrey,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                RadiusConstants.barRadius)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "",
                                      style: TextStyle(
                                          color: AppColors.blueFont,
                                          fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        ///QUESTION CARD
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.blueBg,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 24),
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: AppColors.blueBg,
                            borderRadius: BorderRadius.circular(
                                RadiusConstants.commonRadius),
                            border: Border.all(
                                width: 2, color: AppColors.borderGrey),
                          ),
                        ),
                        Container(
                          height: 55,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 24),
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: AppColors.blueBg,
                            borderRadius: BorderRadius.circular(
                                RadiusConstants.commonRadius),
                            border: Border.all(
                                width: 2, color: AppColors.borderGrey),
                          ),
                        ),
                        Container(
                          height: 55,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 24),
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: AppColors.blueBg,
                            borderRadius: BorderRadius.circular(
                                RadiusConstants.commonRadius),
                            border: Border.all(
                                width: 2, color: AppColors.borderGrey),
                          ),
                        ),
                        Container(
                          height: 55,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 24),
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: AppColors.blueBg,
                            borderRadius: BorderRadius.circular(
                                RadiusConstants.commonRadius),
                            border: Border.all(
                                width: 2, color: AppColors.borderGrey),
                          ),
                        ),
                        const Spacer(),

                        ///NEXT BUTTON
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          decoration: BoxDecoration(
                              color: AppColors.blueFont,
                              borderRadius: BorderRadius.circular(
                                  RadiusConstants.commonRadius)),
                          child: const Center(
                            child: Text(
                              Strings.next,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}
