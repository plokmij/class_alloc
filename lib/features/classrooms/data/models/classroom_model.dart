import '../../domain/entities/classroom.dart';

class ClassroomModel extends Classroom {
  ClassroomModel({
    required super.id,
    required super.name,
    required super.size,
    required super.layout,
  });

  factory ClassroomModel.fromParsedJson(Map<String, dynamic> json) {
    return ClassroomModel(
      id: json['id'],
      name: json['name'],
      size: json['size'],
      layout: Layout.fromName(json['layout']),
    );
  }
}
