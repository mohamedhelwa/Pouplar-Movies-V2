import 'package:base_flutter/res.dart';
import 'package:flutter/material.dart';

class AnimatedLogo extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final bool? removePadding;

  const AnimatedLogo({
    super.key,
    this.height,
    this.width,
    this.color,
    this.removePadding = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: removePadding!
            ? EdgeInsets.zero
            : const EdgeInsets.only(bottom: 70),
        child: Image.asset(
          Res.logo,
          width: width ?? double.infinity,
          height: height,
        ),
      ),
    );
  }
}
