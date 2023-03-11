part of 'movie_details_widgets_imports.dart';

class BuildPosterImage extends StatelessWidget {
  final String imageUrl;
  const BuildPosterImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedImage(
      url: imageUrl,
      bgColor: MyColors.white,
      height: MediaQuery.of(context).size.height * 0.5,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      placeHolder: const NetworkImagePlaceholder(),
    );
  }
}
