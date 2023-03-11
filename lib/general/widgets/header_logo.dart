import 'package:base_flutter/res.dart';
import 'package:flutter/material.dart';

class HeaderLogo extends StatelessWidget {
  final double? height;
  final double? width;
  const HeaderLogo({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width * 0.25,
      height: height ?? MediaQuery.of(context).size.width * 0.25,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(Res.logo),
      ),
    );
  }
}
