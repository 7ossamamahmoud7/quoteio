import 'package:echoes/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'font_weight_handler.dart';

class TextStyles {
  static TextStyle font22WhiteMedium = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.white,
    height: 1.3,
    letterSpacing: 1.1,
    wordSpacing: 1.1,
    fontFamily: AppStrings.fontFamily,
  );
  static TextStyle font24PurpleBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.primaryColor,
    letterSpacing: 1.15,
    fontFamily: AppStrings.fontFamily,
  );
}
