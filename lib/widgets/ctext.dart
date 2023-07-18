import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget ctext(String text,
    {Color color = Colors.black,
    double? fontSize = 12,
    FontWeight? fontWeight = FontWeight.w500,
    TextAlign? textAlign,
    double minFontSize = 8,
    int? maxLines = 1000,
    double maxFontSize = double.infinity,
    TextOverflow? overflow,
    double? latterSpacing,
    double? wordSpacing,
    TextDecoration? decoration}) {
  return AutoSizeText(
    text,
    maxFontSize: maxFontSize,
    minFontSize: minFontSize,
    maxLines: maxLines,
    overflow: overflow,
    textAlign: textAlign,
    style: GoogleFonts.poppins(
        decoration: decoration,
        fontSize: fontSize,
        letterSpacing: latterSpacing ?? 0.5,
        fontWeight: fontWeight,
        color: color,
        wordSpacing: wordSpacing),
  );
}
