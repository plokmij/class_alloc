import 'classroom.dart';

class ClassroomDetail extends Classroom {
  final String subject;

  ClassroomDetail({
    required int id,
    required String name,
    required int size,
    required Layout layout,
    required this.subject,
  }) : super(id: id, name: name, size: size, layout: layout);
}
