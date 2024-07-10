import 'package:flutter/material.dart';
import 'package:simple_app/app/pages/home_page.dart';
import 'package:simple_app/app/theme/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomThemes.lightTheme, // Definindo o tema inicial
      home: const HomePage(),
    );
  }
}
