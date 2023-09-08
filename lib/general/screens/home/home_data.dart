part of 'home_imports.dart';

class HomeData {
  final TextEditingController searchController = TextEditingController();

  final GenericBloc<int> homeTabBarIndexCubit = GenericBloc(0);
  final GenericBloc<bool> clearSearchButtonVisibility = GenericBloc(false);
  final GenericBloc<bool> moviesErrorVisibilityCubit = GenericBloc(false);
  final GenericBloc<bool> searchingEnabledCubit = GenericBloc(false);
  final GenericBloc<int> currentSearchPageKeyCubit = GenericBloc(1);

  static const pageSize = 10;
  final PagingController<int, MovieModel> moviesPagingController =
      PagingController(firstPageKey: 1);
  final PagingController<int, MovieModel> searchableMoviesPagingController =
      PagingController(firstPageKey: 1);

  void fetchNowPlayingMoviesList(BuildContext context, int pageKey) async {
    try {
      final moviesList =
          await GeneralRepository(context).getPlayingNowMovies(pageKey);

      final isLastPage = moviesList.length < pageSize;
      if (isLastPage) {
        moviesPagingController.appendLastPage(moviesList);
      } else {
        final nextPageKey = pageKey + 1;
        moviesPagingController.appendPage(
            moviesList.toSet().toList(), nextPageKey);
      }
    } catch (e) {
      myPrint("ERROR in Get Playing Now Movies ==> $e");
      moviesPagingController.error = e;
      moviesErrorVisibilityCubit.onUpdateData(true);
    }
  }

  void onSearchTapped(BuildContext context) {
    if (searchController.text.trim().isEmpty) {
      CustomToast.showSimpleToast(msg: tr(context, "pleaseEnterMovieName"));
      return;
    }

    Utils.onControllerTextChange(
        searchController.text, clearSearchButtonVisibility);

    if (searchController.text.trim().isNotEmpty &&
        searchController.text.length >= 2) {
      searchingEnabledCubit.onUpdateData(true);
      searchWithMovieName(context, searchController.text.trim());
    } else {
      searchingEnabledCubit.onUpdateData(false);
      moviesPagingController.refresh();
    }
  }

  void searchWithMovieName(BuildContext context, String query) async {
    if (!(query.trim().isNotEmpty && query.length >= 2)) {
      return;
    }

    try {
      final moviesList = await GeneralRepository(context)
          .searchForMovie(query, currentSearchPageKeyCubit.state.data);

      final isLastPage = moviesList.length < pageSize;
      if (isLastPage) {
        searchableMoviesPagingController.appendLastPage(moviesList);
      } else {
        final nextPageKey = currentSearchPageKeyCubit.state.data + 1;
        searchableMoviesPagingController.appendPage(
            moviesList.toSet().toList(), nextPageKey);
      }
    } catch (e) {
      myPrint("ERROR in Search With Movie Name ==> $e");
      searchableMoviesPagingController.error = e;
      moviesErrorVisibilityCubit.onUpdateData(true);
    }
  }

  void clearSearchText() {
    if (searchController.text.trim().isNotEmpty) {
      searchController.clear();
      Future.delayed(const Duration(milliseconds: 300), () {
        clearSearchButtonVisibility.onUpdateData(false);
      });
      searchingEnabledCubit.onUpdateData(false);
      moviesPagingController.refresh();
      searchableMoviesPagingController.itemList = [];
    }
  }
}
