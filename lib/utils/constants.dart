import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle kTextStyleGrey(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(fontSize: size, color: Colors.grey),
  );
}

TextStyle kTextStyleWhite(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(fontSize: size, color: Colors.white),
  );
}

TextStyle kTextStyleBlack(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(
      fontSize: size,
      color: Colors.black,
    ),
  );
}

TextStyle kTextStyleBoldGrey(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(
      fontSize: size,
      color: Colors.grey,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle kTextStyleBoldBlack(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(
      fontSize: size,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle kTextStyleBoldWhite(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(
      fontSize: size,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget kVerticalSpace(double height) => SizedBox(height: height);
