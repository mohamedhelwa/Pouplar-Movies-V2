import 'package:custom_widgets/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final String title;
  final Color? color;
  final double? size;
  final double? letterSpace;
  final double? wordSpace;
  final String? fontFamily;
  final TextAlign? alien;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final int? maxLines;

  const MyText({
    Key? key,
    required this.title,
    this.color,
    this.size,
    this.letterSpace,
    this.wordSpace,
    this.fontFamily,
    this.alien,
    this.decoration,
    this.overflow,
    this.fontWeight,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: alien ?? TextAlign.start,
      textScaleFactor: WidgetUtils.lang == "ar" ? 1 : 1.2,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color ?? Colors.black,
        fontSize: size != null
            ? WidgetUtils.lang == "ar"
                ? (size! + 1.2)
                : size!
            : 16,
        letterSpacing: letterSpace,
        wordSpacing: wordSpace,
        decoration: decoration ?? TextDecoration.none,
        fontWeight: fontWeight ??
            (WidgetUtils.lang == "ar" ? FontWeight.w500 : FontWeight.w400),
        fontFamily: fontFamily ??
            (WidgetUtils.lang == "ar"
                ? GoogleFonts.cairo().fontFamily
                : GoogleFonts.roboto().fontFamily),
      ),
    );
  }
}
