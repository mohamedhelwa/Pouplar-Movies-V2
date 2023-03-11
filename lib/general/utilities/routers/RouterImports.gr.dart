// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:base_flutter/general/models/movie_model.dart' as _i6;
import 'package:base_flutter/general/screens/home/home_imports.dart' as _i2;
import 'package:base_flutter/general/screens/movie_details/movie_details_imports.dart'
    as _i3;
import 'package:base_flutter/general/screens/splash/splash_imports.dart' as _i1;
import 'package:flutter/material.dart' as _i5;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>();
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.Splash(
          key: args.key,
          navigatorKey: args.navigatorKey,
        ),
        opaque: true,
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.Home(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    MovieDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailsRouteArgs>();
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i3.MovieDetails(
          key: args.key,
          movie: args.movie,
        ),
        opaque: true,
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          HomeRoute.name,
          path: '/Home',
        ),
        _i4.RouteConfig(
          MovieDetailsRoute.name,
          path: '/movie-details',
        ),
      ];
}

/// generated route for
/// [_i1.Splash]
class SplashRoute extends _i4.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    _i5.Key? key,
    required _i5.GlobalKey<_i5.NavigatorState> navigatorKey,
  }) : super(
          SplashRoute.name,
          path: '/',
          args: SplashRouteArgs(
            key: key,
            navigatorKey: navigatorKey,
          ),
        );

  static const String name = 'SplashRoute';
}

class SplashRouteArgs {
  const SplashRouteArgs({
    this.key,
    required this.navigatorKey,
  });

  final _i5.Key? key;

  final _i5.GlobalKey<_i5.NavigatorState> navigatorKey;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key, navigatorKey: $navigatorKey}';
  }
}

/// generated route for
/// [_i2.Home]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/Home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.MovieDetails]
class MovieDetailsRoute extends _i4.PageRouteInfo<MovieDetailsRouteArgs> {
  MovieDetailsRoute({
    _i5.Key? key,
    required _i6.MovieModel movie,
  }) : super(
          MovieDetailsRoute.name,
          path: '/movie-details',
          args: MovieDetailsRouteArgs(
            key: key,
            movie: movie,
          ),
        );

  static const String name = 'MovieDetailsRoute';
}

class MovieDetailsRouteArgs {
  const MovieDetailsRouteArgs({
    this.key,
    required this.movie,
  });

  final _i5.Key? key;

  final _i6.MovieModel movie;

  @override
  String toString() {
    return 'MovieDetailsRouteArgs{key: $key, movie: $movie}';
  }
}
