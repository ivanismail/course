import 'package:course/app/themes/colors.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData themeData() => ThemeData(
        primaryColor: MyColor.purple(),
        // fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: MyColor.netral2(),
      );
}
