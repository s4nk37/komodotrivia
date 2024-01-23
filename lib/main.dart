import 'package:flutter/material.dart';
import 'package:komodotrivia/providers/question_provider.dart';
import 'package:provider/provider.dart';
import './utils/routes.dart';

import 'ui/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<QuestionProvider>(
          create: (_) => QuestionProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Komodo Trivia',
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
