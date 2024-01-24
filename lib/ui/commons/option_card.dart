import 'package:flutter/material.dart';
import 'package:komodotrivia/utils/constants/colors_constants.dart';
import 'package:komodotrivia/utils/constants/layout_constants.dart';

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
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.blueBg : Colors.transparent,
          borderRadius: BorderRadius.circular(RadiusConstants.commonRadius),
          border: Border.all(
              width: 2,
              color: isSelected || isFalse
                  ? (isSelected ? AppColors.blueFont : AppColors.red)
                  : AppColors.borderGrey),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.fontGrey,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            if (isFalse)
              const Icon(
                Icons.cancel,
                color: AppColors.red,
              ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: AppColors.blueFont,
              ),
            if (!(isFalse || isSelected))
              const Icon(
                Icons.circle_outlined,
                color: AppColors.borderGrey,
              ),
          ],
        ),
      ),
    );
  }
}
