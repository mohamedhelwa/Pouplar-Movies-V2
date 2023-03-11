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
          Res.placeholder,
          width: width ?? double.infinity,
          height: height,
        ),
      ),
    );
  }
}
//  LoopAnimation(
//   builder: (context, child, double value) {
//     return AnimatedOpacity(
//       duration: Duration(milliseconds: 300),
//       opacity: value,
//       child: !stopResize!
//           ? AnimatedContainer(
//               duration: Duration(milliseconds: 300),
//               child: Image.asset(
//                 Res.oraLogo,
//                 color: color ?? MyColors.primary,
//                 width: value >= 0.7
//                     ? width ?? MediaQuery.of(context).size.width * 0.25
//                     : width ??
//                         MediaQuery.of(context).size.width * 0.25 - 40,
//                 height: value >= 0.7
//                     ? height ?? MediaQuery.of(context).size.width * 0.25
//                     : height ??
//                         MediaQuery.of(context).size.width * 0.25 - 40,
//               ),
//             )
//           : Image.asset(
//               Res.oraLogo,
//               color: color ?? MyColors.primary,
//               width: width,
//               height: height,
//             ),
//     );
//   },
//   duration: const Duration(milliseconds: 1500),
//   tween: Tween<double>(begin: 0.0, end: 1.0),
//   curve: Curves.ease,
// ),
