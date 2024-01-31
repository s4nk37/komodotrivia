import 'package:flutter/material.dart';

import 'configs/app_config.dart';
import 'constants/colors_constants.dart';
import 'constants/strings_constants.dart';

final ThemeData lightTheme = ThemeData(
  fontFamily: kAppFont,
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.kBgWhite,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.kBgWhite,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColors.kFontBlack),
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: AppColors.kBgWhite,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: AppColors.kFontBlack,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    contentTextStyle: TextStyle(
      color: AppColors.kFontBlack,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ),
  iconTheme: const IconThemeData(color: AppColors.kFontBlack),
  canvasColor: AppColors.kBgWhite,
  colorScheme: const ColorScheme.light(
    background: AppColors.kBgWhite,
    brightness: Brightness.light,
    primary: AppColors.kBlueFont,
    primaryContainer: AppColors.kBlueBg,
    secondary: AppColors.kOrange,
    error: AppColors.kRed,
    errorContainer: AppColors.kRedBg,
    onBackground: AppColors.kFontBlack,
    onPrimary: AppColors.kFontBlack,
    onPrimaryContainer: AppColors.kFontGrey,
    shadow: AppColors.kBorderGrey,
    outline: AppColors.kBorderGrey,
    surface: Colors.white,
    onSurface: AppColors.kGreyBg,
  ),
);

final ThemeData darkTheme = ThemeData(
  fontFamily: kAppFont,
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.kBgBlack,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.kBgBlack,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColors.kFontWhite),
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: AppColors.kBgWhite,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: AppColors.kFontBlack,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    contentTextStyle: TextStyle(
      color: AppColors.kFontBlack,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ),
  iconTheme: const IconThemeData(color: AppColors.kFontWhite),
  canvasColor: AppColors.kBgBlack,
  colorScheme: const ColorScheme.dark(
    background: AppColors.kBgBlack,
    brightness: Brightness.dark,
    primary: AppColors.kBlueFont,
    primaryContainer: AppColors.kGreyBg,
    secondary: AppColors.kOrange,
    error: AppColors.kRed,
    errorContainer: AppColors.kRedBg,
    onBackground: AppColors.kFontWhite,
    onPrimary: AppColors.kFontWhite,
    onPrimaryContainer: AppColors.kFontGrey,
    shadow: AppColors.kBorderGrey,
    outline: AppColors.kBorderGrey,
    surface: AppColors.kGreyBg,
    onSurface: AppColors.kFontWhite,
  ),
);

class ThemeProvider extends ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  ThemeData get currentTheme => _isDarkTheme ? darkTheme : lightTheme;

  ThemeProvider() {
    getThemeAtInit();
  }

  getThemeAtInit() async {
    _isDarkTheme = prefs.getBool(Strings.isDarkMode) ?? false;
    notifyListeners();
  }

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    print("Theme changed to: ${_isDarkTheme ? 'Dark' : 'Light'}");
    prefs.setBool(Strings.isDarkMode, _isDarkTheme);
    notifyListeners();
  }
}
