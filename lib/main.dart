import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/provider/restaurants_provider.dart';
import 'package:restaurant_app/screen/detail_page.dart';
import 'package:restaurant_app/screen/home_page.dart';
import 'package:restaurant_app/screen/splash_page.dart';
import 'package:restaurant_app/utils/constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constant.appName,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.splash,
      routes: {
        Routes.splash: (context) => SplashPage(),
        Routes.home: (context) => ChangeNotifierProvider<RestaurantsProvider>(
          create: (_) => RestaurantsProvider(apiService: ApiService()),
          child: HomePage(),
        ),
        Routes.detail: (context) => DetailPage(
          restaurant: ModalRoute.of(context)?.settings.arguments as String,
        ),
      },
    );
  }
}

