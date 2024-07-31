import '../../../../core/domain/entities/subject.dart';
import 'classroom_detail.dart';

class ClassroomDetailWithSubject extends ClassroomDetail {
  final Subject? subject;

  ClassroomDetailWithSubject({
    required super.id,
    required super.name,
    required super.size,
    required super.layout,
    this.subject,
    super.subjectId,
  });
}
