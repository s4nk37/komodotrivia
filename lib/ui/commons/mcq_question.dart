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
      padding: EdgeInsets.only(top: 20),
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
        ),
        SizedBox(
          height: 20,
        ),
        OptionCard(title: "Football", isSelected: false, isFalse: false),
        OptionCard(title: "Cricket", isSelected: true, isFalse: false),
        OptionCard(title: "Basketball", isSelected: false, isFalse: true),
        OptionCard(title: "Tennis", isSelected: false, isFalse: false),
      ],
    );
  }
}
