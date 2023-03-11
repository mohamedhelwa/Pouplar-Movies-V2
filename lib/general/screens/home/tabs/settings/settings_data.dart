part of 'settings_imports.dart';

class SettingsData {
  final GenericBloc<String> langCubit = GenericBloc("en");
  final GenericBloc<bool> languagesVisibilityCubit = GenericBloc(false);

  void initLanguageState(String lang) {
    langCubit.onUpdateData(lang);
  }

  void changeLanguage(BuildContext context) async {
    if (WidgetUtils.lang != langCubit.state.data) {
      Utils.changeLanguage(langCubit.state.data, context);

      await Future.delayed(const Duration(milliseconds: 100), () {
        CustomToast.showSimpleToast(
            msg: tr(context, "languageChangedSuccessfully"));
      });
    } else {
      CustomToast.showSimpleToast(
          msg: tr(context, "thisLanguageIsAlreadySelected"));
    }
  }
}
