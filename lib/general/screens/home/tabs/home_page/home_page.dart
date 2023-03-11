part of 'home_page_imports.dart';

class HomePage extends StatefulWidget {
  final HomeData homeData;
  const HomePage({Key? key, required this.homeData}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageData homePageData = HomePageData();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const DefaultAppBar(
          title: 'Popular Movies',
          showBackButton: false,
        ),
        body: Column(
          children: [
            BuildSearchArea(homeData: widget.homeData),
            BuildFiltersArea(homeData: widget.homeData),
            BuildMoviesList(homeData: widget.homeData),
          ],
        ),
      ),
    );
  }
}
