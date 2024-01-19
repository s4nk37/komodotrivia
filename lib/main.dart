import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Komodo Trivia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Komodo Trivia'),
          backgroundColor: Colors.amber,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Text("Question 1"),
              color: Colors.amber.shade50,
            ),
            Card(
              child: Text("Question 2"),
              color: Colors.amber.shade50,
            ),
            Card(
              child: Text("Question 3"),
              color: Colors.amber.shade50,
            ),
            Card(
              child: Text("Question 4"),
              color: Colors.amber.shade50,
            ),
            Card(
              child: Text("Question 5"),
              color: Colors.amber.shade50,
            ),
          ],
        ));
  }
}
