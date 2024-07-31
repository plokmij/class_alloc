import 'package:class_alloc/features/classrooms/presentation/blocs/classroom_detail_cubit/classroom_detail_cubit.dart';
import 'package:class_alloc/features/classrooms/presentation/blocs/classrooms_cubit/classrooms_cubit.dart';
import 'package:class_alloc/features/registration/presentation/blocs/registration_cubit/registration_cubit.dart';
import 'package:class_alloc/features/students/presentation/blocs/student_detail_cubit/student_detail_cubit.dart';
import 'package:class_alloc/features/subjects/presentation/blocs/subject_detail_cubit/subject_detail_cubit.dart';
import 'package:class_alloc/features/subjects/presentation/blocs/subjects_cubit/subjects_cubit.dart';
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
          create: (context) => getIt<StudentCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<StudentDetailCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<SubjectsCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<SubjectDetailCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ClassroomsCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ClassroomDetailCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<RegistrationCubit>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Classroom Manager',
        debugShowCheckedModeBanner: false,
        routerDelegate: appRouter.routerDelegate,
        routeInformationParser: appRouter.routeInformationParser,
        routeInformationProvider: appRouter.routeInformationProvider,
      ),
    );
  }
}
