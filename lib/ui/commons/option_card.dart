import 'package:flutter/material.dart';
import 'package:komodotrivia/utils/constants/colors_constants.dart';
import 'package:komodotrivia/utils/constants/layout_constants.dart';

class OptionCard extends StatefulWidget {
  final String title;
  final bool isSelected;
  final bool isFalse;
  // final Function onTap;
  const OptionCard({
    super.key,
    required this.title,
    required this.isSelected,
    required this.isFalse,
    //required this.onTap,
  });

  @override
  State<OptionCard> createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  bool _showHighlight = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showHighlight = true;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: (widget.isSelected && _showHighlight)
              ? AppColors.blueBg
              : Colors.transparent,
          borderRadius: BorderRadius.circular(RadiusConstants.commonRadius),
          border: Border.all(
              width: 2,
              color: (widget.isSelected || widget.isFalse) && _showHighlight
                  ? (widget.isSelected ? AppColors.blueFont : AppColors.red)
                  : AppColors.borderGrey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                widget.title,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.fontGrey,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Visibility(
                visible: _showHighlight,
                child: Column(
                  children: [
                    if (widget.isFalse)
                      const Icon(
                        Icons.cancel,
                        color: AppColors.red,
                      ),
                    if (widget.isSelected)
                      const Icon(
                        Icons.check_circle,
                        color: AppColors.blueFont,
                      ),
                  ],
                )),
            if (!_showHighlight)
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
