import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import 'colors.dart';

class ThemesStyle {
  ThemeData lightTheme = ThemeData(
    fontFamily: 'Segoe UI',
    scaffoldBackgroundColor: AppColor.blue,
    textTheme: TextTheme(
      /// localization Button Text Style
      bodyText2: TextStyle(color: AppColor.blue, fontSize: 14.0.sp,
          fontWeight: FontWeight.w300),
        ///form Text Style
        subtitle1: TextStyle(color: AppColor.textColorGrey,
            fontSize: 14.0.sp,fontWeight: FontWeight.w300),
      /// Register & Login Button Text Style
      headline6: TextStyle(color: AppColor.white,fontSize: 16.0.sp,
          fontWeight: FontWeight.w100),
        /// Account User Text Style
        headline5: TextStyle(color: AppColor.blue,fontSize: 18.0.sp,
            fontWeight: FontWeight.w300),
        /// AppBar Text Style
        headline4: TextStyle(color: AppColor.white,fontSize: 24.0.sp,
            fontWeight: FontWeight.w200),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
  );
}
