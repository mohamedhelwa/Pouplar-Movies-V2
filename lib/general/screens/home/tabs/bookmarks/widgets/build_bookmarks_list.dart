part of 'bookmarks_widgets_imports.dart';

class BuildBookmarksList extends StatelessWidget {
  final HomeData homeData;
  final BookmarksData bookmarksData;

  const BuildBookmarksList(
      {Key? key, required this.bookmarksData, required this.homeData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<MovieModel>>,
        GenericState<List<MovieModel>>>(
      bloc: bookmarksData.bookmarksListCubit,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          if (state.data.isNotEmpty) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                alignment: state.data.length < 2
                    ? WidgetUtils.lang == "ar"
                        ? Alignment.topRight
                        : Alignment.topLeft
                    : Alignment.center,
                padding: state.data.length < 2
                    ? const EdgeInsets.symmetric(horizontal: 10)
                    : null,
                child: Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: List.generate(
                    state.data.length,
                    (index) => BuildMovieCard(
                      model: state.data[index],
                      bookmarkMovie: () => bookmarksData.bookmarkMovie(
                          homeData, state.data[index].id ?? 0),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: BuildEmptyContainer(
                emptyText: tr(context, "noBookmarksMoviesTillNow"),
              ),
            );
          }
        } else {
          return const BuildLoadingContainer();
        }
      },
    );
  }
}
