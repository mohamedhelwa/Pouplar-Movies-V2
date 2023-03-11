part of 'home_imports.dart';

class HomeData {
  final TextEditingController searchController = TextEditingController();

  final GenericBloc<int> homeTabBarIndexCubit = GenericBloc(0);
  final GenericBloc<List<MovieModel>> moviesListCubit = GenericBloc([]);
  final GenericBloc<bool> clearSearchButtonVisibility = GenericBloc(false);
  final GenericBloc<bool> moviesErrorVisibilityCubit = GenericBloc(false);
  final GenericBloc<bool> filterByVoteCountsSwitchCubit = GenericBloc(false);

  final moviesRefreshController =
      StreamController<SwipeRefreshState>.broadcast();

  Stream<SwipeRefreshState> get moviesRefreshStream =>
      moviesRefreshController.stream;

  List<MovieModel> searchableMoviesList = [];

  void getPopularMovies(BuildContext context, {bool refresh = true}) async {
    filterByVoteCountsSwitchCubit.onUpdateData(false);
    try {
      var data = await GeneralRepository(context).getPopularMovies(refresh);
      if (data != null) {
        moviesListCubit.onUpdateData(data);
        searchableMoviesList = moviesListCubit.state.data;
      } else {
        moviesErrorVisibilityCubit.onUpdateData(true);
        moviesListCubit.onUpdateData([]);
      }
    } catch (e) {
      myPrint('Error in getPopularMovies: $e');
      moviesErrorVisibilityCubit.onUpdateData(true);
      moviesListCubit.onUpdateData([]);
    }
    moviesRefreshController.sink.add(SwipeRefreshState.hidden);
  }

  void onSearchChanged(String value) {
    Utils.onControllerTextChange(value, clearSearchButtonVisibility);

    if (value.trim().isNotEmpty &&
        value.length >= 2 &&
        searchableMoviesList.isNotEmpty) {
      searchWithMovieName(value.trim());
    } else {
      moviesListCubit.onUpdateData(searchableMoviesList);
    }
  }

  void searchWithMovieName(String value) {
    myPrint("________ Search With Movie Name ________");

    List<MovieModel> filtered = [];

    filtered = searchableMoviesList
        .where((movie) =>
            movie.title?.toLowerCase().contains(value.toLowerCase()) ?? false)
        .toList();

    if (filtered.isNotEmpty) {
      moviesListCubit.onUpdateData(filtered);
    } else {
      moviesListCubit.onUpdateData([]);
    }
  }

  void bookmarkMovie(int movieId) {
    moviesListCubit.onUpdateData(moviesListCubit.state.data.map((movie) {
      if (movie.id == movieId) {
        movie.isBookmarked = !movie.isBookmarked!;
      }
      return movie;
    }).toList());
  }

  void sortByVoteCount() {
    moviesListCubit.onUpdateData(
      moviesListCubit.state.data
        ..sort((a, b) => b.voteCount?.compareTo(a.voteCount ?? 0) ?? 0),
    );
  }

  void filterByVoteAverage() {
    List<MovieModel> filtered = searchableMoviesList
        .where((movie) => (movie.voteAverage ?? 0) < 6)
        .toList();

    moviesListCubit.onUpdateData(
      filtered
        ..sort((a, b) => b.voteAverage?.compareTo(a.voteAverage ?? 0) ?? 0),
    );

    filterByVoteCountsSwitchCubit.onUpdateData(true);
  }

  void resetFilter() {
    moviesListCubit.onUpdateData(searchableMoviesList);
    filterByVoteCountsSwitchCubit.onUpdateData(false);
  }

  void clearSearchText() {
    if (searchController.text.trim().isNotEmpty) {
      searchController.clear();
      if (searchableMoviesList.isNotEmpty) {
        moviesListCubit.onUpdateData(searchableMoviesList);
      }
      Future.delayed(const Duration(milliseconds: 300), () {
        clearSearchButtonVisibility.onUpdateData(false);
      });
    }
  }
}
