import 'package:app_meow/pages/init_page.dart';
import 'package:app_meow/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meow...',
      theme: CatTheme.style(),
      home: InitPage(),
    );
  }
}
