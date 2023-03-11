part of 'settings_widgets_imports.dart';

class BuildChangeLanguageArea extends StatelessWidget {
  final SettingsData settingsData;
  const BuildChangeLanguageArea({Key? key, required this.settingsData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.secondaryText.withOpacity(0.05),
        border: Border.all(color: MyColors.secondaryFrame),
        borderRadius: BorderRadius.circular(10),
      ),
      child: BlocBuilder<GenericBloc<String>, GenericState<String>>(
        bloc: settingsData.langCubit,
        builder: (context, state) {
          return Column(
            children: [
              BuildLanguageItem(
                settingsData: settingsData,
                langCode: "ar",
                state: state,
                flag: Res.egyptFlag,
                title: tr(context, "arabic"),
              ),
              BuildLanguageItem(
                settingsData: settingsData,
                langCode: "en",
                state: state,
                flag: Res.americaFlag,
                title: tr(context, "english"),
              ),
            ],
          );
        },
      ),
    );
  }
}
