import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/common/navigation_path.dart';
import 'package:flutter_ui_demo/common/ui_home_screen.dart';
import './apps/apps.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter UIs Demo',
      theme: ThemeData(fontFamily: 'lato'),
      routes: {
        '/': (ctx) => UIHomeScreen(),
        NavigationPath.homeScreen: (ctx) => HomeScreen(),
        NavigationPath.chWelcomeScreen: (ctx) => ChWelcomeScreen(),
        NavigationPath.covidHomePage: (ctx) => CovidHomePage(),
        NavigationPath.furHomeScreen: (ctx) => FurHomeScreen(),
      },
    );
  }
}
