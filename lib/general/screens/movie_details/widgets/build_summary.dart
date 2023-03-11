part of 'movie_details_widgets_imports.dart';

class BuildSummary extends StatelessWidget {
  final MovieModel movie;
  const BuildSummary({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: MyText(
              title: "${movie.releaseDate}",
              size: 14,
              color: MyColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                MyText(
                  title: "${movie.voteAverage}",
                  size: 14,
                  color: MyColors.black,
                  fontWeight: FontWeight.bold,
                ),
                const Icon(Icons.star, color: Colors.amber),
              ],
            ),
          ),
          Expanded(
            child: BuildVoteCount(voteCount: "${movie.voteCount}"),
          ),
        ],
      ),
    );
  }
}
