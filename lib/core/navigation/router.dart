import 'package:class_alloc/features/registration/presentation/pages/registration_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/classrooms/presentation/pages/classroom_detail_page.dart';
import '../../features/classrooms/presentation/pages/classrooms_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/registration/presentation/pages/registrations_page.dart';
import '../../features/students/presentation/pages/student_details_page.dart';
import '../../features/students/presentation/pages/students_page.dart';
import '../../features/subjects/presentation/pages/subject_detail_page.dart';
import '../../features/subjects/presentation/pages/subjects_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
          path: 'students',
          routes: [
            GoRoute(
              path: ':id',
              builder: (context, state) {
                final id = int.parse(state.pathParameters['id'] ?? '');
                return StudentDetailsPage(studentId: id);
              },
            ),
          ],
          builder: (context, state) => StudentsPage(),
        ),
        GoRoute(
          path: 'subjects',
          routes: [
            GoRoute(
              path: ':id',
              builder: (context, state) {
                final id = int.parse(state.pathParameters['id'] ?? '');
                return SubjectDetailPage(subjectId: id);
              },
            ),
          ],
          builder: (context, state) => SubjectsPage(),
        ),
        GoRoute(
          path: 'classrooms',
          routes: [
            GoRoute(
              path: ':id',
              builder: (context, state) {
                final id = int.parse(state.pathParameters['id'] ?? '0');
                return ClassroomDetailPage(
                  id: id,
                  classroomName: state.extra as String,
                );
              },
            ),
          ],
          builder: (context, state) => ClassroomsPage(),
        ),
        GoRoute(
          path: 'registration',
          routes: [
            GoRoute(
              path: ':id',
              builder: (context, state) {
                final id = int.parse(state.pathParameters['id'] ?? '');
                return RegistrationDetailPage(
                  registrationId: id,
                );
              },
            ),
          ],
          builder: (context, state) => RegistrationsPage(),
        ),
      ],
    ),
    GoRoute(
      path: '/subject-selection',
      name: 'subject-selection',
      builder: (context, state) => SubjectsPage(isSelectorMode: true),
    ),
  ],
);
