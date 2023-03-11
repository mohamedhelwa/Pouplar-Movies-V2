part of 'home_page_widgets_imports.dart';

class BuildSortButton extends StatelessWidget {
  final HomeData homeData;
  const BuildSortButton({Key? key, required this.homeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: () => homeData.sortByVoteCount(),
      child: Row(
        children: [
          Icon(
            Icons.sort,
            color: MyColors.primary,
          ),
          const SizedBox(width: 5),
          MyText(
            title: tr(context, "sortByVoteCount"),
            size: screenWidth <= 350 ? 9 : 12,
            color: MyColors.primary,
          ),
        ],
      ),
    );
  }
}
