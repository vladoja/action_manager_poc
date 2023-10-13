import 'package:action_manager_poc/config/routes/routes.dart';
import 'package:action_manager_poc/config/theme/app_themes.dart';
import 'package:action_manager_poc/features/app/presentation/bloc/action/action_bloc.dart';
import 'package:action_manager_poc/features/app/presentation/bloc/personal_bloc.dart';
import 'package:action_manager_poc/features/app/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PersonalBloc(),
          ),
          BlocProvider(
            create: (context) => ActionBloc(),
          )
        ],
        child: MaterialApp(
          theme: theme(),
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const HomePage(),
        ));
  }
}
