import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:custom_widgets/localization/set_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'blocks/lang_cubit/lang_cubit.dart';
import 'utilities/main_data/MainDataImports.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigatorKey = GlobalKey<NavigatorState>();
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LangCubit, LangState>(
      builder: (context, state) {
        return MaterialApp.router(
          scrollBehavior: const CupertinoScrollBehavior(),
          debugShowCheckedModeBanner: false,
          theme: MainData.defaultThem,
          title: "Popular Movies",
          supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
          localizationsDelegates: const [
            SetLocalization.localizationsDelegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: state.locale,
          routerDelegate: _appRouter.delegate(
              initialRoutes: [SplashRoute(navigatorKey: navigatorKey)]),
          routeInformationParser: _appRouter.defaultRouteParser(),
          builder: (ctx, child) {
            child = FlutterEasyLoading(child: child);
            return child;
          },
        );
      },
    );
  }
}
