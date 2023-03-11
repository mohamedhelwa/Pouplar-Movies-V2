part of 'home_page_widgets_imports.dart';

class BuildMovieCard extends StatelessWidget {
  final MovieModel model;
  final Function() bookmarkMovie;

  const BuildMovieCard({
    Key? key,
    required this.model,
    required this.bookmarkMovie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return CustomShadowContainer(
      onTap: () => AutoRouter.of(context).push(
        MovieDetailsRoute(movie: model),
      ),
      alignment: AlignmentDirectional.center,
      width: screenWidth * .45,
      height: screenWidth * .735,
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                CachedImage(
                  url: "${ApiNames.imageBaseUrl}${model.posterPath}",
                  bgColor: MyColors.blurColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  placeHolder: const NetworkImagePlaceholder(),
                ),
                if (model.voteAverage != null)
                  BuildRateBanner(rate: "${model.voteAverage!}"),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    title: "${model.title}",
                    color: MyColors.black,
                    size: screenWidth <= 350 || WidgetUtils.lang == "ar"
                        ? 10
                        : 12,
                    fontWeight: FontWeight.bold,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    letterSpace: WidgetUtils.lang == "ar" ? 0 : 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BuildVoteCount(voteCount: "${model.voteCount}"),
                      BuildBookmarkButton(
                        model: model,
                        bookmarkMovie: bookmarkMovie,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
