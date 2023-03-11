part of 'home_page_widgets_imports.dart';

class BuildBookmarkButton extends StatelessWidget {
  final MovieModel model;
  final Function() bookmarkMovie;
  const BuildBookmarkButton({
    Key? key,
    required this.bookmarkMovie,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return IconButton(
      splashRadius: 20,
      onPressed: bookmarkMovie,
      icon: Icon(
        model.isBookmarked!
            ? Icons.bookmark_added
            : Icons.bookmark_add_outlined,
        color: model.isBookmarked! ? MyColors.red : MyColors.black,
        size: screenWidth <= 350 ? 27 : 32,
      ),
    );
  }
}
