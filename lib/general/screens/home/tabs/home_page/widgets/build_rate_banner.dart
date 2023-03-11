part of 'home_page_widgets_imports.dart';

class BuildRateBanner extends StatelessWidget {
  final String rate;
  const BuildRateBanner({Key? key, required this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 12,
      left: -32,
      child: RotationTransition(
        turns: const AlwaysStoppedAnimation(-45 / 360),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 3),
          decoration: BoxDecoration(
            color: MyColors.greenSuccess,
            border: Border.all(
              color: MyColors.green,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyText(
                title: rate,
                color: Colors.white,
                size: 12,
                fontWeight: FontWeight.bold,
                alien: TextAlign.center,
              ),
              const SizedBox(width: 5),
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
