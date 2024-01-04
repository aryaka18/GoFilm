import 'package:flutter/material.dart';
import 'package:gofilm/main_screen.dart';

void main() => runApp(const GoFilmApp());

class GoFilmApp extends StatelessWidget {
  const GoFilmApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}