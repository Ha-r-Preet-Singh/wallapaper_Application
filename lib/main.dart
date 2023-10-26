import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/api/api_helper.dart';
import 'package:wallpaper_app/bloc%202/trending_bloc.dart';

import 'package:wallpaper_app/screens/bottom%20navigation%20bar/bottom_bar.dart';
import 'package:wallpaper_app/searchbloc/wallpaper_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => WallpaperBloc(apiHelper: ApiHelper()),
    ),
    BlocProvider(
      create: (context) => TrendingBloc(apiHelper: ApiHelper()),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BottomBar(),
    );
  }
}
