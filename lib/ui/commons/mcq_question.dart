import 'package:flutter/material.dart';
import 'package:komodotrivia/ui/commons/option_card.dart';

class McqQuestion extends StatefulWidget {
  const McqQuestion({super.key});

  @override
  State<McqQuestion> createState() => _McqQuestionState();
}

class _McqQuestionState extends State<McqQuestion> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 20),
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.lightBlue.shade100,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Transform.translate(
                offset: const Offset(0, -18),
                child: const Stack(
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
              const SizedBox(
                height: 50,
              ),
              const Text("What is the most popular sports in history?")
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const OptionCard(title: "Football", isSelected: false, isFalse: false),
        const OptionCard(title: "Cricket", isSelected: true, isFalse: false),
        const OptionCard(title: "Basketball", isSelected: false, isFalse: true),
        const OptionCard(title: "Tennis", isSelected: false, isFalse: false),
      ],
    );
  }
}
