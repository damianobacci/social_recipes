import 'package:flutter/material.dart';
import 'package:social_recipes/screens/homepage.dart';
import 'package:social_recipes/screens/add_product.dart';
import 'package:social_recipes/screens/about_page.dart';

// Themes

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.green);
var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 55, 107, 57));

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Recipe',
      theme: ThemeData(
        colorScheme: kColorScheme,
      ),
      darkTheme: ThemeData(colorScheme: kDarkColorScheme),
      home: const HomePage(),
      routes: {
        "/home": (context) => const HomePage(),
        "/add": (context) => AddProduct(),
        "/about": (context) => const AboutPage(),
      },
    );
  }
}
