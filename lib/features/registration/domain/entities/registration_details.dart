import 'package:class_alloc/core/modules/students/domain/entities/student.dart';

import '../../../../core/modules/subjects/domain/entities/subject.dart';
import 'registration.dart';

class RegistrationDetails extends Registration {
  final Subject subject;
  final Student student;

  RegistrationDetails({
    required this.subject,
    required this.student,
    required super.id,
    required super.subjectId,
    required super.studentId,
  });
}
