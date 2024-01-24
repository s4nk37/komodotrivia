import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../providers/question_provider.dart';
import '/ui/commons/quiz_category_card.dart';
import '../../utils/constants/layout_constants.dart';
import '../../utils/constants/textstyle_constants.dart';
import '../../generated/assets.dart';
import '../../utils/constants/colors_constants.dart';
import '../../utils/constants/strings_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  init() async {
    await Provider.of<QuestionProvider>(context, listen: false)
        .fetchAndSetQuestions();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgWhite,
        body: Padding(
          padding:
              PaddingConstants.scaffoldPadding.copyWith(top: 24, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${Strings.hi} Komodo!',
                        style: largeTitle,
                      ),
                      Text(
                        Strings.letsmakethisdayproductive,
                        style: subTitle,
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/55942632?v=4'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                height: 70,
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
                  borderRadius:
                      BorderRadius.circular(RadiusConstants.commonRadius),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(children: [
                      Image.asset(Assets.imagesTrophy),
                      const SizedBox(width: 10),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Strings.ranking,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: AppColors.fontBlack),
                          ),
                          Text(
                            "A++",
                            style: TextStyle(color: AppColors.blueFont),
                          ),
                        ],
                      )
                    ]),
                    const VerticalDivider(
                      thickness: 0.5,
                      indent: 5,
                      endIndent: 5,
                    ),
                    Row(children: [
                      Image.asset(Assets.imagesCoin),
                      const SizedBox(width: 10),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Strings.points,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: AppColors.fontBlack),
                          ),
                          Text(
                            "100",
                            style: TextStyle(color: AppColors.blueFont),
                          ),
                        ],
                      )
                    ])
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                Strings.letsplay,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.fontBlack),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: GridView.count(
                  padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
                  crossAxisCount: 2,
                  crossAxisSpacing: 17,
                  mainAxisSpacing: 29,
                  children: const [
                    QuizCategoryCard(
                        title: Strings.sports,
                        imagePath: Assets.imagesBasketball,
                        numberOfQuestions: 50),
                    QuizCategoryCard(
                        title: Strings.math,
                        imagePath: Assets.imagesCalculator,
                        numberOfQuestions: 20),
                    QuizCategoryCard(
                        title: Strings.history,
                        imagePath: Assets.imagesCalendar,
                        numberOfQuestions: 10),
                    QuizCategoryCard(
                        title: Strings.geography,
                        imagePath: Assets.imagesMap,
                        numberOfQuestions: 20),
                    QuizCategoryCard(
                        title: Strings.science,
                        imagePath: Assets.imagesChemistry,
                        numberOfQuestions: 30),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
