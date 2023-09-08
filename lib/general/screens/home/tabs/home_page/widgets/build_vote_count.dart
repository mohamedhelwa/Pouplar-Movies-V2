part of 'home_page_widgets_imports.dart';

class BuildVoteCount extends StatelessWidget {
  final String voteCount;
  const BuildVoteCount({Key? key, required this.voteCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
      child: Row(
        children: [
          Icon(
            Icons.thumb_up,
            color: MyColors.black,
            size: screenWidth <= 350 ? 20 : 22,
          ),
          const SizedBox(width: 4),
          MyText(
            title: voteCount,
            color: MyColors.primary,
            size: screenWidth <= 350 ? 10 : 14,
            fontWeight: FontWeight.bold,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
