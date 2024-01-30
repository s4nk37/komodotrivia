import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/score_provider.dart';
import '/ui/screens/home_screen.dart';
import '/providers/question_provider.dart';
import '/utils/constants/strings_constants.dart';
import '/utils/routes.dart';
import 'utils/theme.dart';

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
        ListenableProvider(
          create: (_) => ThemeProvider(),
        )
      ],
      child: MaterialApp(
        title: Strings.kAppTitle,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
        routes: Routes.routes,
        initialRoute: Routes.homeScreen,
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
