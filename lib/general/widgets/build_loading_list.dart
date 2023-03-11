import 'package:base_flutter/res.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BuildLoadingContainer extends StatelessWidget {
  final String? lottieUrl;
  final bool? repeat;
  final double? width;

  const BuildLoadingContainer({
    Key? key,
    this.lottieUrl,
    this.repeat,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        lottieUrl ?? Res.loadingList,
        repeat: repeat ?? true,
        width: width,
      ),
    );
  }
}
