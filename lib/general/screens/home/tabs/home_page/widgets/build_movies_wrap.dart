part of 'home_page_widgets_imports.dart';

class BuildMoviesWrap extends StatelessWidget {
  final HomeData homeData;
  final List<MovieModel> moviesList;

  const BuildMoviesWrap({
    Key? key,
    required this.homeData,
    required this.moviesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwipeRefresh.adaptive(
      stateStream: homeData.moviesRefreshStream,
      onRefresh: () => homeData.getPopularMovies(context),
      padding: const EdgeInsets.symmetric(vertical: 10).copyWith(bottom: 20),
      children: [
        Container(
          alignment: moviesList.length < 2
              ? WidgetUtils.lang == "ar"
                  ? Alignment.topRight
                  : Alignment.topLeft
              : Alignment.center,
          padding: moviesList.length < 2
              ? const EdgeInsets.symmetric(horizontal: 10)
              : null,
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: List.generate(
              moviesList.length,
              (index) => BuildMovieCard(
                model: moviesList[index],
                bookmarkMovie: () =>
                    homeData.bookmarkMovie(moviesList[index].id ?? 0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
