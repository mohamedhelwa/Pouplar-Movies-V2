part of 'home_page_widgets_imports.dart';

class BuildFiltersArea extends StatelessWidget {
  final HomeData homeData;
  const BuildFiltersArea({Key? key, required this.homeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildSortButton(homeData: homeData),
          BuildFilterSwitch(homeData: homeData),
        ],
      ),
    );
  }
}
