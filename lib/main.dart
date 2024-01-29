import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/score_provider.dart';
import '/ui/screens/home_screen.dart';
import '/providers/question_provider.dart';
import '/utils/constants/strings_constants.dart';
import '/utils/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<QuestionProvider>(
          create: (_) => QuestionProvider(),
        ),
        ListenableProvider<ScoreProvider>(
          create: (_) => ScoreProvider(),
        ),
      ],
      child: MaterialApp(
        title: Strings.appTitle,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: "Roboto",
        ),
        routes: Routes.routes,
        initialRoute: Routes.homeScreen,
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
