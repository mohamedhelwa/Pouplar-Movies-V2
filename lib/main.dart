import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/utilities/utils_functions/ApiNames.dart';
import 'package:dio_helper/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'general/MyApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  GlobalState.instance.set("token", ApiNames.accessToken);

  runApp(
    BlocProvider(
      create: (BuildContext context) => LangCubit(),
      child: const MyApp(),
    ),
  );
}
