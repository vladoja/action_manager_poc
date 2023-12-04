import 'package:action_manager_poc/config/theme/app_themes.dart';
import 'package:action_manager_poc/core/routing/app_router.dart';
import 'package:action_manager_poc/features/app/presentation/bloc/action/action_bloc.dart';
import 'package:action_manager_poc/features/app/presentation/bloc/personal_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = AppRouter.router;

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
      // child: MaterialApp(
      //   theme: theme(),
      //   onGenerateRoute: AppRoutes.onGenerateRoutes,
      //   home: const HomePage(),
      // ),
      child: MaterialApp.router(
        theme: theme(),
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
      ),
    );
  }
}
