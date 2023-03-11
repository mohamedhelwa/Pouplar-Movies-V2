part of 'settings_widgets_imports.dart';

class BuildLanguageItem extends StatelessWidget {
  final SettingsData settingsData;
  final String langCode;
  final GenericState<String> state;
  final String flag;
  final String title;

  const BuildLanguageItem({
    Key? key,
    required this.settingsData,
    required this.langCode,
    required this.state,
    required this.flag,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: langCode,
      groupValue: state.data,
      onChanged: (lang) {
        settingsData.langCubit.onUpdateData(langCode);
        settingsData.changeLanguage(context);
      },
      controlAffinity: ListTileControlAffinity.trailing,
      title: Row(
        children: [
          Image.asset(
            flag,
            width: 25,
            height: 25,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: MyColors.black,
              fontFamily: WidgetUtils.lang == "ar"
                  ? GoogleFonts.cairo().fontFamily
                  : GoogleFonts.roboto().fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
