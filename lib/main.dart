import 'package:flutter/material.dart';
import 'package:freezed_undo_functionality_1/pages/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomeApp(),
    );
  }
}

