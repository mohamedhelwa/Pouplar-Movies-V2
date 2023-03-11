part of 'settings_widgets_imports.dart';

class BuildLanguageTile extends StatelessWidget {
  final SettingsData settingsData;

  const BuildLanguageTile({Key? key, required this.settingsData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
          bloc: settingsData.languagesVisibilityCubit,
          builder: (context, state) {
            return CustomShadowContainer(
              onTap: () => settingsData.languagesVisibilityCubit
                  .onUpdateData(!state.data),
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  BuildChangeLanguageListTile(expanded: state.data),
                  if (state.data) const SizedBox(height: 10),
                  if (state.data)
                    BuildChangeLanguageArea(settingsData: settingsData),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
