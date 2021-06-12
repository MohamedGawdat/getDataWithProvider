import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colours.dart';

class AppTheme {
  static final ThemeData APP_THEME = new ThemeData(
      primaryColor: AppColors.PRIMARY,
      backgroundColor: Colors.white,
      textTheme: GoogleFonts.ubuntuTextTheme(),
      buttonColor: AppColors.PRIMARY,
      // buttonColor: AppColors.YELLOW_COLOR,
      primaryTextTheme:
      TextTheme(headline6: TextStyle(color: AppColors.Sec_Color, fontWeight: FontWeight.w700,letterSpacing: 1)),
      appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(color: AppColors.Sec_Color),
          backgroundColor: AppColors.PRIMARY,
          elevation: 1,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColors.MainTextColor)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              primary: AppColors.PRIMARY,
              onPrimary: AppColors.PRIMARY)));
}