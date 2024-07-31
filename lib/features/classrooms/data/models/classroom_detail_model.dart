import '../../domain/entities/classroom.dart';
import '../../domain/entities/classroom_detail.dart';

class ClassroomDetailModel extends ClassroomDetail {
  ClassroomDetailModel({
    required super.id,
    required super.name,
    required super.size,
    required super.layout,
    required super.subjectId,
  });

  factory ClassroomDetailModel.fromParsedJson(Map<String, dynamic> json) {
    return ClassroomDetailModel(
      id: json['id'],
      name: json['name'],
      size: json['size'],
      layout: Layout.fromName(json['layout']),
      subjectId: json['subject'] is int ? json['subject'] : null,
    );
  }
}
