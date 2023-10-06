import 'package:action_manager_poc/config/routes/routes.dart';
import 'package:action_manager_poc/config/theme/app_themes.dart';
import 'package:action_manager_poc/features/app/presentation/pages/home/home_page.dart';
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
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      home: const HomePage(),
    );
  }
}
