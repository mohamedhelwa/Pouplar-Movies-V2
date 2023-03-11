part of 'RouterImports.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    //general routes
    AdaptiveRoute(page: Splash, initial: true),
    CustomRoute(page: Home),
    AdaptiveRoute(page: MovieDetails),
  ],
)
class $AppRouter {}
