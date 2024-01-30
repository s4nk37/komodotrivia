import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/providers/score_provider.dart';
import '../../utils/constants/colors_constants.dart';
import '../../utils/constants/strings_constants.dart';
import '../../utils/constants/textstyle_constants.dart';

class QuizEndScreen extends StatefulWidget {
  const QuizEndScreen({super.key});

  @override
  State<QuizEndScreen> createState() => _QuizEndScreenState();
}

class _QuizEndScreenState extends State<QuizEndScreen> {
  @override
  Widget build(BuildContext context) {
    var scoreProvider = Provider.of<ScoreProvider>(context);

    return WillPopScope(
      onWillPop: () async {
        scoreProvider.updatePoints();
        Navigator.popUntil(context, (route) => route.isFirst);
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColors.kBgWhite,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            child:
                const Icon(Icons.arrow_back_ios, color: AppColors.kFontWhite),
            onTap: () {
              scoreProvider.updatePoints();
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ),
        body: Column(
          children: [
            CustomPaint(
              painter: HeaderCurvedContainer(),
              child: SizedBox(
                height: 400,
                width: double.infinity,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        Strings.kCongratulations,
                        style: TextStyle(
                            color: AppColors.kFontWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: 30),
                      ),
                      GestureDetector(
                        child: Text(
                          Strings.kPlayAgain,
                          style: TextStyle(
                              color: AppColors.kFontBlack.withOpacity(0.5),
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Score: ${scoreProvider.correctAnswers}/${scoreProvider.totalQuestions}",
                      style: kLargeTitle.copyWith(color: AppColors.kOrange),
                    ),
                    const CircleAvatar(
                      radius: 100,
                      backgroundColor: AppColors.kBlueBg,
                      child: Icon(
                        Icons.check,
                        color: AppColors.kBlueFont,
                        size: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Curved Container
class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = AppColors.kBlueFont;
    Path path = Path()
      ..relativeLineTo(0, 400)
      ..quadraticBezierTo(size.width / 2, 300.0, size.width, 400)
      ..relativeLineTo(0, -400)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
