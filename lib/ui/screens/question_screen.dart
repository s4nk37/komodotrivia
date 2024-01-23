import 'package:flutter/material.dart';
import 'package:komodotrivia/ui/commons/mcq_question.dart';
import 'package:komodotrivia/ui/commons/truefalse_question.dart';
import 'package:komodotrivia/utils/constants/layout_constants.dart';

import '../../utils/constants/colors_constants.dart';
import '../../utils/constants/strings_constants.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
              PaddingConstants.scaffoldPadding.copyWith(top: 24, bottom: 24),
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
                        borderRadius:
                            BorderRadius.circular(RadiusConstants.barRadius),
                      ),
                      child: const Row(
                        children: [
                          Expanded(
                            child: LinearProgressIndicator(
                              value: 0.5,
                              minHeight: 10,
                              color: AppColors.orange,
                              backgroundColor: AppColors.borderGrey,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(RadiusConstants.barRadius)),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "5/10",
                            style: TextStyle(
                                color: AppColors.blueFont, fontSize: 12),
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
              const Expanded(
                // child: McqQuestion(),
                child: TrueFalseQuestion(),
              ),

              ///NEXT BUTTON
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                    color: AppColors.blueFont,
                    borderRadius:
                        BorderRadius.circular(RadiusConstants.commonRadius)),
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
      ),
    );
  }
}
