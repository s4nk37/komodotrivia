import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/score_provider.dart';
import '../../utils/constants/colors_constants.dart';
import '../../utils/constants/strings_constants.dart';
import '../../utils/constants/textstyle_constants.dart';
import '../../utils/routes.dart';

class QuizEndScreen extends StatefulWidget {
  const QuizEndScreen({super.key});

  @override
  State<QuizEndScreen> createState() => _QuizEndScreenState();
}

class _QuizEndScreenState extends State<QuizEndScreen> {
  @override
  Widget build(BuildContext context) {
    var scoreprovider = Provider.of<ScoreProvider>(context);

    return PopScope(
      canPop: false, // Control whether the back button can pop the route
      onPopInvoked: (didPop) {
        scoreprovider.updatePoints();
        Navigator.pushNamed(context, Routes.homeScreen);
      },
      child: Scaffold(
        backgroundColor: AppColors.bgWhite,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios, color: AppColors.fontWhite),
            onTap: () {
              scoreprovider.updatePoints();
              Navigator.pushNamed(context, Routes.homeScreen);
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
                        Strings.congratulations,
                        style: TextStyle(
                            color: AppColors.fontWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: 30),
                      ),
                      GestureDetector(
                        child: Text(
                          Strings.playAgain,
                          style: TextStyle(
                              color: AppColors.fontBlack.withOpacity(0.5),
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
                      "Score: ${scoreprovider.correctAnswers}/${scoreprovider.totalQuestions}",
                      style: largeTitle.copyWith(color: AppColors.orange),
                    ),
                    const CircleAvatar(
                      radius: 100,
                      backgroundColor: AppColors.blueBg,
                      child: Icon(
                        Icons.check,
                        color: AppColors.blueFont,
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
    Paint paint = Paint()..color = AppColors.blueFont;
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
