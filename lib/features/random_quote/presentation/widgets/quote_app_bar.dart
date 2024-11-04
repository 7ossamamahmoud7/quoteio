import 'package:echoes/core/utils/app_colors.dart';
import 'package:echoes/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSizeWidget quoteAppBar() => AppBar(
      leading: Icon(
        Icons.format_quote,
        size: 28.h,
        color: AppColors.primaryColor,
      ),
      title: Text(
        "Quoteio",
        style: TextStyles.font24PurpleBold,
      ),
      forceMaterialTransparency: true,
    );
