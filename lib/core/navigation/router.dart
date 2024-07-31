import '../../features/home/presentation/pages/home_page.dart';
import '../../features/students/presentation/pages/students_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/students',
      builder: (context, state) => StudentsPage(),
    ),
    GoRoute(
      path: '/subjects',
      builder: (context, state) => Container(),
    ),
    GoRoute(
      path: '/classrooms',
      builder: (context, state) => Container(),
    ),
    GoRoute(
      path: '/registration',
      builder: (context, state) => Container(),
    ),
  ],
);
