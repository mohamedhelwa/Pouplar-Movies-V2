import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/my_text.dart';
import 'package:flutter/material.dart';

class BuildBoldTitle extends StatelessWidget {
  final String title;
  final Color? color;
  final double? size;
  final EdgeInsetsGeometry? padding;

  const BuildBoldTitle({
    Key? key,
    required this.title,
    this.color,
    this.size,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 10),
      child: MyText(
        title: title,
        size: size ?? 16,
        color: color ?? MyColors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
