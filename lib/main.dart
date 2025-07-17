import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:responsive_adaptive_ui/core/local_storage_service/prefs.dart';
import 'package:responsive_adaptive_ui/core/observer/observer.dart';

import 'core/cache/cache_helper.dart';
import 'core/local_storage_service/hive.dart';
import 'core/routes_manager/route_generator.dart';
import 'core/routes_manager/routes.dart';
import 'di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  SharedPrefs prefs = SharedPrefs();
  await prefs.init();

  Directory dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  await HiveCart.clearAll();
  bool? isSavedToken;
  var token = prefs.getString("token");
  if (token != null) {
    isSavedToken = true;
  } else {
    isSavedToken = false;
  }

  runApp(MyApp(
    isSaved: isSavedToken,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isSaved});
  final bool isSaved;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: isSaved ? Routes.mainLayoutRoute : Routes.splashRoute,
    );
  }
}
