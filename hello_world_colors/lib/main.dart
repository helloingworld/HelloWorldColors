import 'package:flutter/material.dart';
import 'package:hello_world_colors/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.white,
        primaryColor: Colors.white,
        accentColor: Colors.black,
        // brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,

        appBarTheme: const AppBarTheme(elevation: 0.0),
      ),
      home: HomeScreen(),
    );
  }
}

