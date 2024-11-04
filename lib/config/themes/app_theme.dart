import 'package:echoes/core/utils/app_colors.dart';
import 'package:echoes/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightAppTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.primaryColor,
    brightness: Brightness.light,
    fontFamily: AppStrings.fontFamily,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
  );
}
