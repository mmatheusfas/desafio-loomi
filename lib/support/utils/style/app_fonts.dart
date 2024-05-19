import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  AppFonts._();

  static TextStyle archivoNarrowSemiBold(double size, [Color? color]) {
    return GoogleFonts.archivoNarrow(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle montserratRegular(double size, [Color? color]) {
    return GoogleFonts.montserrat(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle montserratSemiBold(double size, [Color? color]) {
    return GoogleFonts.montserrat(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle montserratMedium(double size, [Color? color]) {
    return GoogleFonts.montserrat(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle montserratBold(double size, [Color? color]) {
    return GoogleFonts.montserrat(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w700,
    );
  }
}
