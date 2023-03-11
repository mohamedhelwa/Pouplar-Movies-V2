part of 'home_page_widgets_imports.dart';

class BuildSearchArea extends StatelessWidget {
  final HomeData homeData;
  const BuildSearchArea({Key? key, required this.homeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15).copyWith(top: 20, bottom: 0),
      child: GenericTextField(
        fieldTypes: FieldTypes.normal,
        type: TextInputType.text,
        action: TextInputAction.search,
        controller: homeData.searchController,
        validate: (value) => value!.noValidate(),
        enableBorderColor: MyColors.grey.withOpacity(.5),
        margin: const EdgeInsets.only(bottom: 10),
        hint: tr(context, "search"),
        textColor: MyColors.primary,
        onChange: (value) => homeData.onSearchChanged(value),
        onSubmit: () =>
            homeData.onSearchChanged(homeData.searchController.text),
        contentPadding: const EdgeInsets.symmetric(horizontal: 5),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(15),
          child: Image.asset(Res.search, width: 20, height: 20),
        ),
        suffixIcon: ClearTextFieldButton(
          controller: homeData.searchController,
          visibilityCubit: homeData.clearSearchButtonVisibility,
          onTap: () => homeData.clearSearchText(),
        ),
      ),
    );
  }
}
