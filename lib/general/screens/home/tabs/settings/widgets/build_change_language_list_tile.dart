part of 'settings_widgets_imports.dart';

class BuildChangeLanguageListTile extends StatelessWidget {
  final bool expanded;
  const BuildChangeLanguageListTile({Key? key, required this.expanded})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          WidgetUtils.lang == "ar" ? Res.egyptFlag : Res.americaFlag,
          width: 35,
          height: 35,
        ),
        const SizedBox(width: 10),
        MyText(
          title: tr(context, "changeLanguage"),
          size: 14,
          color: MyColors.black,
          fontWeight: FontWeight.bold,
        ),
        const Spacer(),
        RotatedBox(
          quarterTurns: expanded
              ? WidgetUtils.lang == "ar"
                  ? 1
                  : 3
              : WidgetUtils.lang == "ar"
                  ? 3
                  : 1,
          child: Icon(
            Icons.arrow_forward_ios,
            size: 25,
            color: MyColors.black,
          ),
        ),
      ],
    );
  }
}
