part of 'home_imports.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final HomeData homeData = HomeData();

  @override
  void initState() {
    homeData.getPopularMovies(context, refresh: false);
    homeData.getPopularMovies(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Utils.handleBackPress(context),
      child: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: MyColors.white,
          body: BuildTabBarPages(homeData: homeData),
          bottomNavigationBar: BuildBottomTabBar(homeData: homeData),
        ),
      ),
    );
  }
}
