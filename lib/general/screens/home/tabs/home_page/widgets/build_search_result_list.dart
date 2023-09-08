part of 'home_page_widgets_imports.dart';

class BuildSearchResultList extends StatelessWidget {
  final HomeData homeData;
  const BuildSearchResultList({Key? key, required this.homeData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, MovieModel>(
      pagingController: homeData.searchableMoviesPagingController,
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
                      errorVisibilityCubit: homeData.moviesErrorVisibilityCubit,
                      onRefresh: () {
                        homeData.moviesPagingController.refresh();
                        homeData.clearSearchText();
                      },
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
          emptyText: tr(context, "noMoviesMatchedYourSearch"),
        ),
      ),
    );
  }
}
