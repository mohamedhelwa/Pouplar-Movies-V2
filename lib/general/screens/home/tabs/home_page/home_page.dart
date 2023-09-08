part of 'home_page_imports.dart';

class HomePage extends StatefulWidget {
  final HomeData homeData;
  const HomePage({Key? key, required this.homeData}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: DefaultAppBar(
          title: tr(context, "nowPlaying"),
          showBackButton: false,
        ),
        body: Column(
          children: [
            BuildSearchArea(homeData: widget.homeData),
            BuildMoviesList(homeData: widget.homeData),
          ],
        ),
      ),
    );
  }
}
