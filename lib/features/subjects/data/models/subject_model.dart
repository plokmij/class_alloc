import '../../domain/entities/subject.dart';

class SubjectModel extends Subject {
  SubjectModel({
    required super.id,
    required super.name,
    required super.credits,
    required super.teacher,
  });

  factory SubjectModel.fromParsedJson(Map<String, dynamic> json) {
    return SubjectModel(
      id: json['id'],
      name: json['name'],
      credits: json['credits'],
      teacher: json['teacher'],
    );
  }
}
