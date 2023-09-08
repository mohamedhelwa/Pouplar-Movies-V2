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
      placeHolder: const NetworkImagePlaceholder(),
    );
  }
}
