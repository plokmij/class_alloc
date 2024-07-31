import 'classroom.dart';

class ClassroomDetail extends Classroom {
  final String subject;

  ClassroomDetail({
    required super.id,
    required super.name,
    required super.size,
    required super.layout,
    required this.subject,
  });

  bool get hasSubject => subject.isNotEmpty;
}
