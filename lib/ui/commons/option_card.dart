import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final String title;
  final bool isSelected;
  final bool isFalse;
  const OptionCard(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.isFalse});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: isSelected ? Colors.lightBlue.shade50 : Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
            width: isSelected || isFalse ? 2 : 0.5,
            color: isSelected || isFalse
                ? (isSelected ? Colors.lightBlue.shade300 : Colors.redAccent)
                : Colors.grey),
      ),
      child: Row(
        children: [
          Text(title),
          const Spacer(),
          if (isFalse)
            const Icon(
              Icons.cancel,
              color: Colors.redAccent,
            ),
          if (isSelected)
            const Icon(
              Icons.check_circle,
              color: Colors.teal,
            ),
        ],
      ),
    );
  }
}
