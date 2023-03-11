import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/my_text.dart';
import 'package:base_flutter/res.dart';
import 'package:custom_widgets/localization/localization_methods.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BuildEmptyContainer extends StatelessWidget {
  final String? emptyText;
  final bool? showLottie;

  const BuildEmptyContainer({Key? key, this.emptyText, this.showLottie = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          showLottie!
              ? Lottie.asset(
                  Res.emptyList,
                  width: MediaQuery.of(context).size.width * 0.4,
                )
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: MyText(
              title: emptyText ?? tr(context, "noDataAvailable"),
              color: MyColors.primary,
              size: 18,
              alien: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
