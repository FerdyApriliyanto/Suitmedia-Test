import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suitmedia_test/constants/global_color.dart';

class GlobalTextStyle {
  static TextStyle titleH1 = GoogleFonts.poppins(
      fontWeight: FontWeight.w600, fontSize: 24, color: GlobalColor.dark);

  static TextStyle titleH2 = GoogleFonts.poppins(
      fontWeight: FontWeight.w600, fontSize: 18, color: GlobalColor.dark);

  static TextStyle titleH3 = GoogleFonts.poppins(
      fontWeight: FontWeight.w500, fontSize: 16, color: GlobalColor.hintColor);

  static TextStyle titleH4 = GoogleFonts.poppins(
      fontWeight: FontWeight.w400, fontSize: 12, color: GlobalColor.dark);

  static TextStyle titleH5 = GoogleFonts.poppins(
      fontWeight: FontWeight.w500, fontSize: 10, color: GlobalColor.darkLighter);

  static TextStyle buttonText = GoogleFonts.poppins(
      fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white);
}
