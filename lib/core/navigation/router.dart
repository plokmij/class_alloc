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
    ),
    GoRoute(
      path: '/students',
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
    // GoRoute(
    //   path: '/students/:id',
    //   builder: (context, state) {
    //     final id = int.parse(state.pathParameters['id'] ?? '');
    //     return StudentDetailsPage(studentId: id);
    //   },
    // ),
    GoRoute(
      path: '/subjects',
      builder: (context, state) => SubjectsPage(),
    ),
    GoRoute(
      path: '/subjects/select',
      builder: (context, state) => SubjectsPage(
        isSelectorMode: true,
      ),
    ),
    GoRoute(
      path: '/subjects/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id'] ?? '');
        return SubjectDetailPage(subjectId: id);
      },
    ),
    GoRoute(
      path: '/classrooms',
      builder: (context, state) => ClassroomsPage(),
    ),
    GoRoute(
      path: '/classrooms/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id'] ?? '');
        return ClassroomDetailPage(
          id: id,
          classroomName: state.extra as String,
        );
      },
    ),
    GoRoute(
      path: '/registration',
      builder: (context, state) => RegistrationsPage(),
    ),
  ],
);
