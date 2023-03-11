part of 'home_page_widgets_imports.dart';

class BuildMoviesList extends StatelessWidget {
  final HomeData homeData;
  const BuildMoviesList({Key? key, required this.homeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<GenericBloc<List<MovieModel>>,
          GenericState<List<MovieModel>>>(
        bloc: homeData.moviesListCubit,
        builder: (context, state) {
          if (state is GenericUpdateState) {
            if (state.data.isNotEmpty) {
              return BuildMoviesWrap(
                homeData: homeData,
                moviesList: state.data,
              );
            } else {
              return BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                bloc: homeData.moviesErrorVisibilityCubit,
                builder: (context, state) {
                  return state.data
                      ? FetchErrorContainer(
                          errorVisibilityCubit:
                              homeData.moviesErrorVisibilityCubit,
                          onRefresh: () => homeData.getPopularMovies(context),
                          errorText:
                              tr(context, "errorOccurredInGettingMoviesData"),
                        )
                      : BuildEmptyContainer(
                          emptyText: homeData.searchController.text.isEmpty
                              ? tr(context, "noMoviesAvailable")
                              : tr(context, "noMoviesMatchedYourSearch"),
                        );
                },
              );
            }
          } else {
            return const BuildLoadingContainer();
          }
        },
      ),
    );
  }
}
