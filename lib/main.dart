import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'config/theme/app_themes.dart';
import 'core/routing/app_router.dart';
import 'features/app/presentation/bloc/action/action_bloc.dart';
import 'features/app/presentation/bloc/exam_request/exam_requests_bloc.dart';
import 'features/app/presentation/bloc/oso/oso/oso_bloc.dart';
import 'features/app/presentation/bloc/osoby/osoby/osoby_bloc.dart';
import 'features/app/presentation/bloc/personal/personal/personal_bloc.dart';
import 'features/app/presentation/bloc/personal/personal_filtered/personal_filtered_bloc.dart';
import 'features/app/presentation/bloc/personal/personal_search/personal_search_bloc.dart';

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
        BlocProvider<OsobyBloc>(
          create: (context) => OsobyBloc(),
        ),
        BlocProvider<OsoBloc>(
          create: (context) => OsoBloc(),
        ),
        BlocProvider(
          create: (context) => PersonalBloc(),
        ),
        BlocProvider(
          create: (context) => PersonalSearchBloc(),
        ),
        BlocProvider(
          create: (context) => PersonalFilteredBloc(
              initialPersons: context.read<PersonalBloc>().state.persons),
        ),
        BlocProvider(
          create: (context) => ActionBloc(),
        ),
        BlocProvider<ExamRequestsBloc>(
          create: (context) =>
              ExamRequestsBloc(osobyBloc: context.read<OsobyBloc>()),
        ),
      ],
      // child: MaterialApp(
      //   theme: theme(),
      //   onGenerateRoute: AppRoutes.onGenerateRoutes,
      //   home: const HomePage(),
      // ),
      child: MaterialApp.router(
        theme: theme(),
        debugShowCheckedModeBanner: false,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
      ),
    );
  }
}
