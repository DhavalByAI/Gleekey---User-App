import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/style/constants.dart';

class commonText extends StatelessWidget {
  String text;
  FontWeight? fontWeight;
  Color color;
  double fontSize;
  TextAlign? textAlign;
  int? maxlines;
  commonText(
      {super.key,
      required this.text,
      required this.color,
      required this.fontSize,
      this.fontWeight = FontWeight.w500,
      this.textAlign = TextAlign.center,
      this.maxlines});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxlines,
      overflow: TextOverflow.visible,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: kThemeFont,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }
}
