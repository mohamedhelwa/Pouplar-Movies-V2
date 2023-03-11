import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:flutter/material.dart';

class CustomShadowContainer extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final double? height;
  final double? width;
  final BoxConstraints? constraints;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final Color? color;
  final Color? shadowColor;
  final List<BoxShadow>? boxShadow;
  final String? decorationImageUrl;
  final AlignmentDirectional? alignment;
  final bool? decorationImageFilter;

  const CustomShadowContainer({
    Key? key,
    required this.child,
    this.onTap,
    this.height,
    this.width,
    this.constraints,
    this.padding,
    this.margin,
    this.borderRadius,
    this.color,
    this.shadowColor,
    this.boxShadow,
    this.decorationImageUrl,
    this.alignment,
    this.decorationImageFilter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius ?? BorderRadius.circular(10),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      child: Container(
        height: height,
        width: width,
        alignment: alignment ?? AlignmentDirectional.center,
        constraints: constraints,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: color ?? MyColors.white,
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(10.0)),
          image: decorationImageUrl != null
              ? DecorationImage(
                  image: NetworkImage(decorationImageUrl!),
                  colorFilter: decorationImageFilter!
                      ? ColorFilter.mode(
                          Colors.black.withOpacity(0.1),
                          BlendMode.dstIn,
                        )
                      : null,
                  fit: decorationImageFilter! ? BoxFit.cover : null,
                )
              : null,
          boxShadow: boxShadow ??
              [
                BoxShadow(
                  color: shadowColor ?? MyColors.grey.withOpacity(0.7),
                  // spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
        ),
        child: child,
      ),
    );
  }
}
