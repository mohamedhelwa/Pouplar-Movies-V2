import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/my_text.dart';
import 'package:custom_widgets/localization/localization_methods.dart';
import 'package:custom_widgets/utils/widget_utils.dart';
import 'package:custom_widgets/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAlertDialog extends StatelessWidget {
  final String? title;
  final String? contentText;
  final Widget? customTitle;
  final Widget? customContent;
  final List<Widget>? customActions;
  final String? confirmText;
  final String? cancelText;
  final Function()? onConfirm;
  final Function()? onCancel;
  final bool? isScrollable;
  final bool? isDismissible;
  final bool? showCancelButton;
  final double? borderRadius;
  final double? titleFontSize;
  final double? contentFontSize;
  final Color? titleTextColor;
  final Color? contentTextColor;
  final Color? confirmButtonColor;
  final Color? confirmButtonTextColor;
  final Alignment? contentAlignment;

  const CustomAlertDialog({
    Key? key,
    this.title,
    this.customTitle,
    this.contentText,
    this.customContent,
    this.customActions,
    this.confirmText,
    this.cancelText,
    this.onConfirm,
    this.onCancel,
    this.isScrollable,
    this.isDismissible,
    this.showCancelButton,
    this.borderRadius,
    this.titleFontSize,
    this.contentFontSize,
    this.titleTextColor,
    this.contentTextColor,
    this.confirmButtonColor,
    this.confirmButtonTextColor,
    this.contentAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsOverflowAlignment: OverflowBarAlignment.center,
      scrollable: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      insetPadding: const EdgeInsets.all(20),
      title: customTitle ??
          (title != null
              ? MyText(
                  title: "$title",
                  size: titleFontSize ?? 16,
                  color: titleTextColor ?? MyColors.black,
                  fontWeight: FontWeight.bold,
                  alien: TextAlign.center,
                )
              : null),
      content: customContent ??
          (contentText != null
              ? Align(
                  alignment: contentAlignment ?? Alignment.center,
                  child: MyText(
                    title: "$contentText",
                    size: contentFontSize ?? 12,
                    color: contentTextColor ?? MyColors.black,
                    alien: TextAlign.center,
                  ),
                )
              : null),
      actions: customActions ??
          [
            DefaultButton(
              fontFamily: WidgetUtils.lang == "ar"
                  ? "FawryPro"
                  : GoogleFonts.roboto().fontFamily,
              title: confirmText ?? tr(context, "confirm"),
              color: confirmButtonColor ?? MyColors.secondary,
              fontSize: WidgetUtils.lang == "ar" ? 18 : 16,
              textColor: confirmButtonTextColor ?? MyColors.black,
              fontWeight: FontWeight.bold,
              onTap: onConfirm ?? () {},
            ),
            if (showCancelButton ?? true)
              TextButton(
                onPressed: onCancel ?? () => Navigator.of(context).pop(),
                child: MyText(
                  title: cancelText ?? tr(context, "cancel"),
                  size: 12,
                  color: MyColors.black,
                  alien: TextAlign.center,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
    );
  }
}
