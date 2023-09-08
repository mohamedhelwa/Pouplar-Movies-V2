part of 'home_page_widgets_imports.dart';

class BuildNowPlayingList extends StatelessWidget {
  final HomeData homeData;
  const BuildNowPlayingList({Key? key, required this.homeData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        homeData.moviesPagingController.refresh();
      },
      backgroundColor: MyColors.white,
      color: MyColors.primary,
      child: PagedListView<int, MovieModel>(
        pagingController: homeData.moviesPagingController,
        builderDelegate: PagedChildBuilderDelegate<MovieModel>(
          itemBuilder: (context, model, index) => BuildMovieCard(model: model),
          firstPageProgressIndicatorBuilder: (context) =>
              const BuildLoadingContainer(),
          newPageProgressIndicatorBuilder: (context) =>
              const BuildLoadingContainer(),
          firstPageErrorIndicatorBuilder: (context) {
            return BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: homeData.moviesErrorVisibilityCubit,
              builder: (context, state) {
                return state.data
                    ? FetchErrorContainer(
                        errorVisibilityCubit:
                            homeData.moviesErrorVisibilityCubit,
                        onRefresh: () =>
                            homeData.moviesPagingController.refresh(),
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
          },
          newPageErrorIndicatorBuilder: (context) => CupertinoActivityIndicator(
            color: MyColors.secondary,
            radius: 20,
          ),
          noItemsFoundIndicatorBuilder: (context) => BuildEmptyContainer(
            emptyText: tr(context, "noMoviesAvailable"),
          ),
        ),
      ),
    );
  }
}
