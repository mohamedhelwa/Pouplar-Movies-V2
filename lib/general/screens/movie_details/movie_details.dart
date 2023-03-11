part of 'movie_details_imports.dart';

class MovieDetails extends StatefulWidget {
  final MovieModel movie;
  const MovieDetails({Key? key, required this.movie}) : super(key: key);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        backButtonColor: MyColors.white,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          BuildPosterImage(
            imageUrl: "${ApiNames.imageBaseUrl}${widget.movie.posterPath}",
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    title: "${widget.movie.title}",
                    size: 20,
                    color: MyColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  BuildSummary(movie: widget.movie),
                  MyText(
                    title: "${widget.movie.overview}",
                    size: 12,
                    color: MyColors.black,
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
