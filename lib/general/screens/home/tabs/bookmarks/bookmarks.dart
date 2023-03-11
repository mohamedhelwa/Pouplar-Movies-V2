part of 'bookmarks_imports.dart';

class Bookmarks extends StatefulWidget {
  final HomeData homeData;
  const Bookmarks({Key? key, required this.homeData}) : super(key: key);

  @override
  State<Bookmarks> createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  final BookmarksData bookmarksData = BookmarksData();

  @override
  void initState() {
    super.initState();
    bookmarksData.initBookmarksList(widget.homeData.moviesListCubit.state.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: tr(context, "bookmarks"),
        showBackButton: false,
      ),
      body: BuildBookmarksList(
        bookmarksData: bookmarksData,
        homeData: widget.homeData,
      ),
    );
  }
}
