import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Icon(Icons.cancel_outlined),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          Expanded(
                            child: LinearProgressIndicator(
                              value: 0.5,
                              minHeight: 10,
                              color: Colors.teal,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("5/10")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.lightBlue.shade100,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Transform.translate(
                      offset: Offset(0, -18),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: 10,
                            color: Colors.teal,
                          ),
                          Text("10")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text("What is the most popular sports in history?")
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
