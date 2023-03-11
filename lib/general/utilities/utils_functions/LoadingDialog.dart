import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingDialog {
  static showLoadingDialog() {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
      dismissOnTap: false,
      status: WidgetUtils.lang == "ar" ? "جار التحميل..." : "Loading...",
      indicator: const SizedBox(
        width: 70,
        height: 70,
        child: CupertinoActivityIndicator(),
      ),
    );
  }

  static showLoadingView({Color? color}) {
    return const Center(
      child: SizedBox(
        width: 70,
        height: 70,
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
