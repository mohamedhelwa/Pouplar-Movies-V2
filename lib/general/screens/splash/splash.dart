part of 'splash_imports.dart';

class Splash extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  const Splash({Key? key, required this.navigatorKey}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _checkingData();
    super.initState();
  }

  _checkingData() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {
      Utils.manipulateSplashData(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        color: MyColors.white,
        child: AnimationContainer(
          index: 0,
          vertical: true,
          duration: const Duration(milliseconds: 1500),
          distance: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Hero(tag: Res.logo, child: HeaderLogo()),
              Text(
                "Popular Movies",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
