import 'dart:convert';

import 'package:class_alloc/core/network/api_client.dart';
import 'package:injectable/injectable.dart';

import '../models/student_model.dart';

abstract class StudentDataSource {
  Future<List<StudentModel>> getAllStudents();
  Future<StudentModel> getStudentById(int id);
}

@Injectable(as: StudentDataSource)
class StudentDataSourceImpl implements StudentDataSource {
  final ApiClient apiClient;

  StudentDataSourceImpl({required this.apiClient});

  @override
  Future<List<StudentModel>> getAllStudents() async {
    final response = await apiClient.get('/students');

    if (response.statusCode == 200) {
      final students = (response.data as Map)['students'] as List;
      return students
          .map((student) => StudentModel.fromParsedJson(student))
          .toList();
    } else {
      throw Exception('Failed to load students');
    }
  }

  @override
  Future<StudentModel> getStudentById(int id) async {
    final response = await apiClient.get('/students/$id');
    if (response.statusCode == 200) {
      return StudentModel.fromParsedJson(response.data);
    } else {
      throw Exception('Failed to load student');
    }
  }
}
