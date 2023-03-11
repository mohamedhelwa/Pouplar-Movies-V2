part of 'UtilsImports.dart';

class Utils {
  static Future<void> manipulateSplashData(BuildContext context) async {
    initDio(lang: "en");
    initCustomWidgets(language: "en");
    DioUtils.lang = "en";
    AutoRouter.of(context).push(const HomeRoute());
  }

  static initDio({required String lang}) {
    DioUtils.init(
      baseUrl: ApiNames.baseUrl,
      style: CustomInputTextStyle(lang: lang),
      primary: MyColors.primary,
      authLink: HomeRoute.name,
      language: lang,
      dismissFunc: EasyLoading.dismiss,
      showLoadingFunc: LoadingDialog.showLoadingDialog,
      authClick: () {},
    );
  }

  static initCustomWidgets({required String language}) {
    WidgetUtils.init(
      style: CustomInputTextStyle(lang: language),
      primary: MyColors.primary,
      language: language,
      inputStyle: ({
        String? label,
        String? hint,
        Widget? prefixIcon,
        Widget? suffixIcon,
        Widget? prefixWidget,
        Widget? suffixWidget,
        Color? hintColor,
        Color? fillColor,
        BorderRadius? radius,
        Color? focusBorderColor,
        EdgeInsets? padding,
        Color? enableColor,
        TextStyle? hintTextStyle,
      }) =>
          CustomInputDecoration(
        lang: language,
        labelTxt: label,
        hint: hint,
        hintColor: MyColors.grey,
        focusColor: MyColors.secondary,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enableColor: enableColor,
        customFillColor: fillColor,
        padding: padding,
        borderRaduis: 10,
        hintTextStyle: hintTextStyle ??
            TextStyle(
              color: hintColor ?? MyColors.grey,
              fontFamily: WidgetUtils.lang == "ar"
                  ? GoogleFonts.cairo().fontFamily
                  : GoogleFonts.roboto().fontFamily,
            ),
      ),
    );
  }

  static void changeLanguage(String lang, BuildContext context) async {
    DioUtils.lang = lang;
    WidgetUtils.lang = lang;
    context.read<LangCubit>().onUpdateLanguage(lang);
  }

  static void onControllerTextChange(
      String value, GenericBloc<bool> visibilityCubit) {
    if (value.trim().isNotEmpty) {
      visibilityCubit.onUpdateData(true);
    } else {
      Future.delayed(const Duration(milliseconds: 300),
          () => visibilityCubit.onUpdateData(false));
    }
  }

  static void showAlertDialog({
    required context,
    String? title,
    String? contentText,
    Widget? customTitle,
    Widget? customContent,
    List<Widget>? customActions,
    String? confirmText,
    String? cancelText,
    Function()? onConfirm,
    Function()? onCancel,
    bool? isScrollable,
    bool? isDismissible,
    bool? showCancelButton,
    bool? autoDismiss,
    double? borderRadius,
    double? titleFontSize,
    double? contentFontSize,
    Color? titleTextColor,
    Color? contentTextColor,
    Color? confirmButtonColor,
    Color? confirmButtonTextColor,
    Alignment? contentAlignment,
  }) {
    showDialog(
      context: context,
      barrierDismissible: isDismissible ?? true,
      builder: (context) => CustomAlertDialog(
        title: title,
        contentText: contentText,
        customTitle: customTitle,
        customContent: customContent,
        customActions: customActions,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: onConfirm,
        onCancel: onCancel,
        borderRadius: borderRadius,
        titleFontSize: titleFontSize,
        contentFontSize: contentFontSize,
        titleTextColor: titleTextColor,
        contentTextColor: contentTextColor,
        confirmButtonColor: confirmButtonColor,
        confirmButtonTextColor: confirmButtonTextColor,
        contentAlignment: contentAlignment,
        isScrollable: isScrollable,
        isDismissible: isDismissible,
        showCancelButton: showCancelButton,
      ),
    );
    if (autoDismiss ?? false) {
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.of(context).pop();
      });
    }
  }

  static Future<bool> handleBackPress(BuildContext context) async {
    showAlertDialog(
      context: context,
      title: tr(context, "areYouSureYouWantToExit"),
      confirmText: tr(context, "exit"),
      onConfirm: () => SystemNavigator.pop(),
    );
    return Future.value(true);
  }
}
