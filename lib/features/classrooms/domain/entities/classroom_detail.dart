import 'classroom.dart';

class ClassroomDetail extends Classroom {
  final int? subjectId;

  ClassroomDetail({
    required super.id,
    required super.name,
    required super.size,
    required super.layout,
    required this.subjectId,
  });

  bool get hasSubject => subjectId != null;
}
