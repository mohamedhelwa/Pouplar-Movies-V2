import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? titleColor;
  final Widget? leading;
  final Color? backButtonColor;
  final Color? backgroundColor;
  final List<Widget> actions;
  final double? size;
  final bool? showBackButton;

  const DefaultAppBar({
    Key? key,
    this.title,
    this.titleColor,
    this.actions = const [],
    this.leading,
    this.backButtonColor,
    this.size,
    this.showBackButton,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
      title: MyText(
        title: title ?? "",
        size: 14,
        color: titleColor ?? MyColors.primary,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      backgroundColor: backgroundColor ?? MyColors.secondary,
      leading: Visibility(
        visible: showBackButton ?? true,
        child: leading ??
            IconButton(
              padding: EdgeInsets.zero,
              splashRadius: 25,
              icon: Icon(
                Icons.adaptive.arrow_back,
                size: 25,
                color: backButtonColor ?? MyColors.primary,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size ?? 65);
}
