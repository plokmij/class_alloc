import 'package:class_alloc/features/students/presentation/pages/student_details_page.dart';
import 'package:class_alloc/features/subjects/presentation/pages/subjects_page.dart';

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
      path: '/students/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id'] ?? '');
        return StudentDetailsPage(studentId: id);
      },
    ),
    GoRoute(
      path: '/subjects',
      builder: (context, state) => SubjectsPage(),
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
