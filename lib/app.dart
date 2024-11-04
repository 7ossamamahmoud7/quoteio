import 'package:echoes/config/routing/app_router.dart';
import 'package:echoes/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/themes/app_theme.dart';

class Echoes extends StatelessWidget {
  const Echoes({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightAppTheme(),
        title: AppStrings.appName,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
