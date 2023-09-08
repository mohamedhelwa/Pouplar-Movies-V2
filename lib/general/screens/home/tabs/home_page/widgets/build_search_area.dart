part of 'home_page_widgets_imports.dart';

class BuildSearchArea extends StatelessWidget {
  final HomeData homeData;
  const BuildSearchArea({Key? key, required this.homeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15).copyWith(top: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: GenericTextField(
              fieldTypes: FieldTypes.normal,
              type: TextInputType.text,
              action: TextInputAction.search,
              controller: homeData.searchController,
              validate: (value) => value!.noValidate(),
              enableBorderColor: MyColors.grey.withOpacity(.5),
              margin: const EdgeInsets.all(0),
              hint: tr(context, "search"),
              textColor: MyColors.primary,
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
          ),
          const SizedBox(width: 10),
          Expanded(
            child: DefaultButton(
              title: tr(context, "search"),
              onTap: () => homeData.onSearchTapped(context),
              height: 42,
              margin: const EdgeInsets.all(0),
              borderRadius: BorderRadius.circular(25),
              color: MyColors.primary,
              borderColor: MyColors.primary,
              textColor: MyColors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
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
