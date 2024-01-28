// import 'package:flutter/material.dart';
// import 'package:komodotrivia/utils/constants/colors_constants.dart';
// import 'package:komodotrivia/utils/constants/layout_constants.dart';
//
// import 'mcq_question.dart';
//
// class OptionCard extends StatefulWidget {
//   final OptionModel model;
//
//   const OptionCard({
//     super.key,
//     required this.model,
//   });
//
//   @override
//   State<OptionCard> createState() => _OptionCardState();
// }
//
// class _OptionCardState extends State<OptionCard> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // widget.model.onTap();
//         widget.model.isSelected = true;
//         widget.model.revealAnswer = true;
//         setState(() {});
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
//         width: double.infinity,
//         margin: const EdgeInsets.only(bottom: 12),
//         decoration: BoxDecoration(
//           color: (widget.model.isSelected && widget.model.revealAnswer)
//               ? AppColors.blueBg
//               : Colors.transparent,
//           borderRadius: BorderRadius.circular(RadiusConstants.commonRadius),
//           border: Border.all(
//               width: 2,
//               color: (widget.model.isSelected || widget.model.isFalse) &&
//                       widget.model.revealAnswer
//                   ? (widget.model.isSelected
//                       ? AppColors.blueFont
//                       : AppColors.red)
//                   : AppColors.borderGrey),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Text(
//                 widget.model.title,
//                 overflow: TextOverflow.clip,
//                 style: const TextStyle(
//                     fontSize: 18,
//                     color: AppColors.fontGrey,
//                     fontWeight: FontWeight.w500),
//               ),
//             ),
//             Visibility(
//                 visible: widget.model.revealAnswer,
//                 child: Column(
//                   children: [
//                     if (widget.model.isFalse)
//                       const Icon(
//                         Icons.cancel,
//                         color: AppColors.red,
//                       ),
//                     if (widget.model.isSelected && !widget.model.isFalse)
//                       const Icon(
//                         Icons.check_circle,
//                         color: AppColors.blueFont,
//                       ),
//                   ],
//                 )),
//             if (!widget.model.revealAnswer)
//               const Icon(
//                 Icons.circle_outlined,
//                 color: AppColors.borderGrey,
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
