import 'package:class_alloc/features/students/presentation/blocs/student_detail_cubit/student_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/navigation/router.dart';
import 'features/home/presentation/blocs/home_cubit/home_cubit.dart';
import 'features/students/presentation/blocs/students_cubit/student_cubit.dart';
import 'injection.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => getIt<StudentCubit>()..loadStudents(),
        ),
        BlocProvider(
          create: (context) => getIt<StudentDetailCubit>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerDelegate: appRouter.routerDelegate,
        routeInformationParser: appRouter.routeInformationParser,
        routeInformationProvider: appRouter.routeInformationProvider,
      ),
    );
  }
}
