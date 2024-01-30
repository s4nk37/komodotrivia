import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '/providers/question_provider.dart';
import '/ui/commons/mcq_question.dart';
import '../../providers/score_provider.dart';
import '../../utils/constants/layout_constants.dart';
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

  Future<bool> confirmDialog() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(Strings.kDiscardProgress),
        content: const Text(Strings.kYouHaveUnsavedChanges),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text(Strings.kCancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text(Strings.kDiscard),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final response = Provider.of<QuestionProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        return confirmDialog();
      },
      child: Scaffold(
        backgroundColor: AppColors.kBgWhite,
        body: SafeArea(
          child: response.isLoading
              ? Shimmer.fromColors(
                  baseColor: AppColors.kBorderGrey,
                  highlightColor: AppColors.kBlueBg,
                  child: Padding(
                    padding: PaddingConstants.kScaffoldPadding
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
                                border:
                                    Border.all(color: AppColors.kBorderGrey),
                              ),
                              child: const Icon(
                                Icons.close,
                                color: AppColors.kGreyBg,
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
                                      Border.all(color: AppColors.kBorderGrey),
                                  borderRadius: BorderRadius.circular(
                                      RadiusConstants.kBarRadius),
                                ),
                                child: const Row(
                                  children: [
                                    Expanded(
                                      child: LinearProgressIndicator(
                                        value: 1,
                                        minHeight: 10,
                                        color: AppColors.kOrange,
                                        backgroundColor: AppColors.kBorderGrey,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                RadiusConstants.kBarRadius)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "",
                                      style: TextStyle(
                                          color: AppColors.kBlueFont,
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
                            color: AppColors.kBlueBg,
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
                            color: AppColors.kBlueBg,
                            borderRadius: BorderRadius.circular(
                                RadiusConstants.kCommonRadius),
                            border: Border.all(
                                width: 2, color: AppColors.kBorderGrey),
                          ),
                        ),
                        Container(
                          height: 55,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 24),
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: AppColors.kBlueBg,
                            borderRadius: BorderRadius.circular(
                                RadiusConstants.kCommonRadius),
                            border: Border.all(
                                width: 2, color: AppColors.kBorderGrey),
                          ),
                        ),
                        Container(
                          height: 55,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 24),
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: AppColors.kBlueBg,
                            borderRadius: BorderRadius.circular(
                                RadiusConstants.kCommonRadius),
                            border: Border.all(
                                width: 2, color: AppColors.kBorderGrey),
                          ),
                        ),
                        Container(
                          height: 55,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 24),
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: AppColors.kBlueBg,
                            borderRadius: BorderRadius.circular(
                                RadiusConstants.kCommonRadius),
                            border: Border.all(
                                width: 2, color: AppColors.kBorderGrey),
                          ),
                        ),
                        const Spacer(),

                        ///NEXT BUTTON
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          decoration: BoxDecoration(
                              color: AppColors.kBlueFont,
                              borderRadius: BorderRadius.circular(
                                  RadiusConstants.kCommonRadius)),
                          child: const Center(
                            child: Text(
                              Strings.kNext,
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
                )
              : Padding(
                  padding: PaddingConstants.kScaffoldPadding
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
                                border:
                                    Border.all(color: AppColors.kBorderGrey),
                              ),
                              child: const Icon(
                                Icons.close,
                                color: AppColors.kGreyBg,
                                size: 26,
                              ),
                            ),
                            onTap: () async {
                              await confirmDialog()
                                  ? Navigator.pop(context)
                                  : null;
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
                                border:
                                    Border.all(color: AppColors.kBorderGrey),
                                borderRadius: BorderRadius.circular(
                                    RadiusConstants.kBarRadius),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      value: (_currentQuestion + 1) /
                                          response.questions!.length,
                                      minHeight: 10,
                                      color: AppColors.kOrange,
                                      backgroundColor: AppColors.kBorderGrey,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(
                                              RadiusConstants.kBarRadius)),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${_currentQuestion + 1}/${response.questions!.length}",
                                    style: const TextStyle(
                                        color: AppColors.kBlueFont,
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
                          question: response.questions![_currentQuestion],
                        ),
                        //child: TrueFalseQuestion(),
                      ),

                      ///NEXT BUTTON
                      GestureDetector(
                        onTap: () {
                          Provider.of<ScoreProvider>(context, listen: false)
                              .revealAnswers = false;

                          if (_currentQuestion + 1 ==
                              response.questions!.length) {
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
                              color: AppColors.kBlueFont,
                              borderRadius: BorderRadius.circular(
                                  RadiusConstants.kCommonRadius)),
                          child: const Center(
                            child: Text(
                              Strings.kNext,
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
                ),
        ),
      ),
    );
  }
}
