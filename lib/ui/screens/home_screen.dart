import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:komodotrivia/ui/commons/quiz_category_card.dart';

import '../../generated/assets.dart';
import '../../utils/constants/strings_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${Strings.hi} Komodo!',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(Strings.letsmakethisdayproductive),
                    ],
                  ),
                  CircleAvatar(
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
                  borderRadius: BorderRadius.circular(16),
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
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "643",
                            style: TextStyle(color: Colors.blue),
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
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "100",
                            style: TextStyle(color: Colors.blue),
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: GridView.count(
                  padding: const EdgeInsets.only(top: 20),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 30,
                  children: const [
                    QuizCategoryCard(
                        title: "Sports",
                        imagePath: Assets.imagesBasketball,
                        numberOfQuestions: "20"),
                    QuizCategoryCard(
                        title: "Math",
                        imagePath: Assets.imagesCalculator,
                        numberOfQuestions: "50"),
                    QuizCategoryCard(
                        title: "History",
                        imagePath: Assets.imagesCalendar,
                        numberOfQuestions: "50"),
                    QuizCategoryCard(
                        title: "Geography",
                        imagePath: Assets.imagesMap,
                        numberOfQuestions: "50"),
                    QuizCategoryCard(
                        title: "Science",
                        imagePath: Assets.imagesChemistry,
                        numberOfQuestions: "50"),
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
