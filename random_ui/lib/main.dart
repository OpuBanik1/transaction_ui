import 'package:flutter/material.dart';
import 'package:random_ui/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(colorSchemeSeed: Colors.white, brightness: Brightness.dark),
      home: const HomePage(),
    );
  }
}
