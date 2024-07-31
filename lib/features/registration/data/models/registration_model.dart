import '../../domain/entities/registration.dart';

class RegistrationModel extends Registration {
  RegistrationModel({
    required super.id,
    required super.studentId,
    required super.subjectId,
  });

  factory RegistrationModel.fromParsedJson(Map<String, dynamic> json) {
    return RegistrationModel(
      id: json['id'],
      studentId: json['student'],
      subjectId: json['subject'],
    );
  }
}
