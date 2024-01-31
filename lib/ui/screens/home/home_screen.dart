import 'package:flutter/material.dart';
import 'package:komodotrivia/utils/theme.dart';
import 'package:provider/provider.dart';

import '../../../providers/score_provider.dart';
import '../../../utils/constants/layout_constants.dart';
import '../../../utils/constants/textstyle_constants.dart';
import '../../../generated/assets.dart';
import '../../../utils/constants/strings_constants.dart';
import 'quiz_category_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
              PaddingConstants.kScaffoldPadding.copyWith(top: 24, bottom: 0),
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
                        '${Strings.kHi} there!',
                        style: kLargeTitle.copyWith(
                          color: theme.onBackground,
                        ),
                      ),
                      Text(
                        Strings.kLetsmakethisdayproductive,
                        style: kSubTitle,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<ThemeProvider>().toggleTheme();
                    },
                    child: Icon(
                      context.watch<ThemeProvider>().isDarkTheme
                          ? Icons.dark_mode_outlined
                          : Icons.light_mode_outlined,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                height: 70,
                decoration: BoxDecoration(
                  color: theme.surface,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(4, 4),
                    ),
                  ],
                  borderRadius:
                      BorderRadius.circular(RadiusConstants.kCommonRadius),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(children: [
                      Image.asset(Assets.imagesTrophy),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Strings.kRanking,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: theme.onBackground),
                          ),
                          Text(
                            context.watch<ScoreProvider>().ranking,
                            style: TextStyle(
                                color: theme.primary,
                                fontWeight: FontWeight.w700),
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Strings.kPoints,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: theme.onBackground),
                          ),
                          Text(
                            context.watch<ScoreProvider>().points.toString(),
                            style: TextStyle(
                                color: theme.primary,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      )
                    ])
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                Strings.kLetsplay,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: theme.onBackground),
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
                        title: Strings.kSports,
                        id: 21,
                        imagePath: Assets.imagesBasketball,
                        numberOfQuestions: 50),
                    QuizCategoryCard(
                        title: Strings.kMath,
                        id: 19,
                        imagePath: Assets.imagesCalculator,
                        numberOfQuestions: 20),
                    QuizCategoryCard(
                        title: Strings.kHistory,
                        id: 23,
                        imagePath: Assets.imagesCalendar,
                        numberOfQuestions: 10),
                    QuizCategoryCard(
                        title: Strings.kGeography,
                        id: 22,
                        imagePath: Assets.imagesMap,
                        numberOfQuestions: 20),
                    QuizCategoryCard(
                        title: Strings.kScience,
                        id: 17,
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
