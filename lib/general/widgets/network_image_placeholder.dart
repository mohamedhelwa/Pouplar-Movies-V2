import 'package:base_flutter/res.dart';
import 'package:flutter/material.dart';

class NetworkImagePlaceholder extends StatelessWidget {
  final String? placeHolderImg;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  const NetworkImagePlaceholder({
    Key? key,
    this.placeHolderImg,
    this.width,
    this.height,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          placeHolderImg ?? Res.logo,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
