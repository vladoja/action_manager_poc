import 'package:action_manager_poc/config/theme/app_themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Action Manager POC"),
        ),
        body: const Center(
          child: Text("Welcome"),
        ),
      ),
    );
  }
}
