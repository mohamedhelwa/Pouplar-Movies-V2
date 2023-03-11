part of 'bookmarks_imports.dart';

class BookmarksData {
  final GenericBloc<List<MovieModel>> bookmarksListCubit = GenericBloc([]);

  void initBookmarksList(List<MovieModel> moviesList) {
    bookmarksListCubit.onUpdateData(
        moviesList.where((movie) => movie.isBookmarked!).toList());
  }

  void bookmarkMovie(HomeData homeData, int movieId) {
    homeData.moviesListCubit
        .onUpdateData(homeData.moviesListCubit.state.data.map((movie) {
      if (movie.id == movieId) {
        movie.isBookmarked = !movie.isBookmarked!;
      }
      return movie;
    }).toList());

    initBookmarksList(homeData.moviesListCubit.state.data);
  }
}
