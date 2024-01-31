import 'package:flutter/material.dart';

import '../../utils/constants/strings_constants.dart';
import '../../utils/constants/textstyle_constants.dart';

class InternetError extends StatelessWidget {
  const InternetError({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.network_check,
          size: 50,
          color: theme.error,
        ),
        Text(
          Strings.kPleaseCheckYourInternetConnection,
          textAlign: TextAlign.center,
          style: kLargeTitle.copyWith(color: theme.error),
        ),
      ],
    );
  }
}
